//
//  LoginViewModel.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 27/01/2024.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
