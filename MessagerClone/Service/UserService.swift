//
//  UserService.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 13/02/2024.
//

import Foundation
import Firebase

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self) //decode
        self.currentUser = user
        print("DEBUG: current user in sevice is \(currentUser)")
    }
    
    static func fetchAllUser(limit: Int? = nil) async throws -> [User]{
        let query = FirestoreConstants.UserCollection
        if let limit {
            query.limit(to: limit)
        }
        let snapshot = try await query.getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
        return users
    }
    
    static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        FirestoreConstants.UserCollection.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else {return}
            completion(user)
        }
    }
}
