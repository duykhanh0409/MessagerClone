//
//  AuthService.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 27/01/2024.
//

import Foundation
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService() // we should have one instance of AuthService
    
    init(){
        self.userSession = Auth.auth().currentUser // this function to help store user login in the app
        print("DEBUG: USer session id is \(userSession?.uid)")
    }
    
    func login(withEmail email: String, password:String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }catch {
            print("DEBUG FAIL TO signIn USER \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password:String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: CREARE USER \(result.user.uid)")
        }catch {
            print("DEBUG FAIL TO CREARE USER \(error.localizedDescription)") // question where is error com from, answer Swift very cool, can auto give access to this error in site catch, don't need declare error
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
        }catch {
            print("DEBUG: fail to signOut \(error.localizedDescription)")
        }
    }
}
