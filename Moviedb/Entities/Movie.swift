//
//  Movie.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import Foundation

struct Movie {
    let id: Int
    let title: String
    let posterPath: String?
    let releaseDate: Date?
}

extension Movie: Equatable {}
