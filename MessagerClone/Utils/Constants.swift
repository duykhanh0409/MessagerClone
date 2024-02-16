//
//  Constants.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 15/02/2024.
//

import Foundation
import Firebase


struct FirestoreConstants {
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}

class Utils {
    static func uniqueElementsFrom<T: Hashable>(array: [T]) -> [T] {
        var set = Set<T>()
        let result = array.filter {
          guard !set.contains($0) else {
            return false
          }
          set.insert($0)
          return true
        }
        return result
      }
}

