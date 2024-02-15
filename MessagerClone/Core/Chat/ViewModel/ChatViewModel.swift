//
//  ChatViewModel.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 14/02/2024.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, toUser: user)
    }
}
