//
//  ActiveViewModel.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 16/02/2024.
//

import Foundation
import Firebase

class ActiveViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        Task {
            try await fetchUsers()
        }
    }
    @MainActor
    private func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        self.users = try await UserService.fetchAllUser(limit: 10)
        self.users = users.filter({$0.id != currentUid}) 
    }
}
