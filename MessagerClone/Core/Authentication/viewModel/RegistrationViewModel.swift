//
//  RegistrationViewModel.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 27/01/2024.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname)
    }
}
