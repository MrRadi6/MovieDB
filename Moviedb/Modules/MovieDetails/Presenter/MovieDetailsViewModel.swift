//
//  MovieDetailsViewModel.swift
//  Moviedb
//
//  Created by Samir on 6/23/22.
//

import Foundation

struct MovieDetailsViewModel {
    let title: String
    let imageUrl: String?
    let overview: String?
    let rating: Float
    let totalVotes: Int
    let releaseDate: String?
}

extension MovieDetailsViewModel {
    init(movie: MovieDetails) {
        self.title = movie.title
        self.imageUrl = movie.posterPath
        self.overview = movie.overview
        self.rating = movie.rating * 10
        self.totalVotes = movie.totalVotes
        self.releaseDate = DateManager.getMonthDayYear(from: movie.releaseDate)
    }
}
