//
//  MoviesMocks.swift
//  MoviedbTests
//
//  Created by Samir on 6/23/22.
//

import Foundation
@testable import Moviedb

enum MoviesMocks {
    static let movie: Movie = Movie(id: 1,
                                    title: "Movie Title",
                                    posterPath: "imageURL",
                                    releaseDate: Date())

    static let moviePage: MoviesPage = MoviesPage(number: 1,
                                                  totalResults: 20,
                                                  totalPages: 20,
                                                  movies: [movie])

    static let moviePageNoMoreResults: MoviesPage = MoviesPage(number: 1,
                                                               totalResults: 20,
                                                               totalPages: 1,
                                                               movies: [movie])

    static let movieDetails: MovieDetails = MovieDetails(title: "Movie Title",
                                                         posterPath: "imageURL",
                                                         overview: "movie overview",
                                                         rating: 10.0,
                                                         totalVotes: 100,
                                                         releaseDate: Date())
}
