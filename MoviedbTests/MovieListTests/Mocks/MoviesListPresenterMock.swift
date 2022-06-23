//
//  MoviesListPresenterMock.swift
//  MoviedbTests
//
//  Created by Samir on 6/23/22.
//

import Foundation
@testable import Moviedb

class MoviesListPresenterMock: MoviesListInteractorToPresenterProtocol {
    var movies: [Movie]?
    var error: String?

    func didGetTopRatedMovies(_ movies: [Movie]) {
        self.movies = movies
    }

    func didGetMoreTopRatedMovies(_ movies: [Movie]) {
        self.movies = movies
    }

    func didGetMostPopularMovies(_ movies: [Movie]) {
        self.movies = movies
    }

    func didGetMoreMostPopularMovies(_ movies: [Movie]) {
        self.movies = movies
    }

    func failedToGetMovies(with error: String) {
        self.error = error
    }
}
