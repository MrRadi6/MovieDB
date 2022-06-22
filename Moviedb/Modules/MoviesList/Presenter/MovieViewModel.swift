//
//  MovieViewModel.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import Foundation

struct MovieViewModel {
    let imageUrl: String?
    let title: String
    let releaseDate: String?
}

extension MovieViewModel {
    init(movie: Movie) {
        self.imageUrl = movie.posterPath
        self.title = movie.title
        self.releaseDate = DateManager.getMonthDayYear(from: movie.releaseDate)
    }
}
