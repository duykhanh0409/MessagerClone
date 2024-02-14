//
//  InboxViewModel.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 13/02/2024.
//

import Foundation
import Combine
import Firebase


class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
