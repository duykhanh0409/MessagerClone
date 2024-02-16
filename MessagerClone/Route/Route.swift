//
//  Route.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 16/02/2024.
//

import Foundation

enum Route: Hashable {
    case profile(User)
    case chatView(User)
}
