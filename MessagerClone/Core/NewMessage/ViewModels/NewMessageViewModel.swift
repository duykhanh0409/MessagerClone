//
//  NewMessageViewModel.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 13/02/2024.
//

import Foundation
import Firebase

@MainActor
class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }

    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        self.users = try await UserService.fetchAllUser()
        self.users = users.filter({$0.id != currentUid}) // update on main thread
    }
}
