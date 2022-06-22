//
//  Network.swift
//  Moviedb
//
//  Created by Samir on 6/20/22.
//

import Foundation
/// https://developers.themoviedb.org/3/movies/get-movie-details
enum Network {
    enum ContentType {
        static let json = "application/json"
    }

    enum URL {
        static let baseUrl = "https://api.themoviedb.org/3"
        static let image = "http://image.tmdb.org/t/p/w185"
    }

    enum Parameter {
        static let language = "language"
    }
}
