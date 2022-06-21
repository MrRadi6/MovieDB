//
//  MoviesPage.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import Foundation

struct MoviesPage {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let movies: [Movie]
}
