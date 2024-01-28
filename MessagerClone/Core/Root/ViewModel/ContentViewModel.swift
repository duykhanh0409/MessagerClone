//
//  ContentViewModel.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 27/01/2024.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellabes = Set<AnyCancellable>()
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        AuthService.shared.$userSession.sink { [weak self] userSesstionFromAuthService in
            self?.userSession = userSesstionFromAuthService
        }.store(in: &cancellabes)
    }
}
