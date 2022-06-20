//
//  AuthRepository.swift
//  Moviedb
//
//  Created by Samir on 6/21/22.
//

import Foundation

protocol AuthRepositoryProtocol {
    func getUserToken() -> String
}

struct AuthRepository: AuthRepositoryProtocol {
    let storage: UserStorageProtocol

    func getUserToken() -> String {
        return storage.getUserToken()
    }
}
