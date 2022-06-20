//
//  UserStorage.swift
//  Moviedb
//
//  Created by Samir on 6/21/22.
//

import Foundation

protocol UserStorageProtocol {
    func getUserToken() -> String
}

struct UserStorage: UserStorageProtocol {
    func getUserToken() -> String {
        return "acc01dd2ed6513db51bab3416a825a72"
    }
}
