//
//  User.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 21/01/2024.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullname: String
    let email: String
    var profileImageUrl: String?
}

extension User {
    static let MOCK_USER = User(fullname: "khanh Nguyen", email: "duykhanh@gmail.com", profileImageUrl:"facebook")
}
