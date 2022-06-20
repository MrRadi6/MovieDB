//
//  Network.swift
//  Moviedb
//
//  Created by Samir on 6/20/22.
//

import Foundation

enum Network {
    enum ContentType {
        static let json = "application/json"
    }

    enum URL {
        static let baseUrl = "https://api.themoviedb.org/3"
    }

    enum Parameter {
        static let language = "language"
    }
}
