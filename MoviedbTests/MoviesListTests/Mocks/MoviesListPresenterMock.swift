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

    func didGetMovies(_ movies: [Moviedb.Movie]) {
        self.movies = movies
    }
    
    func failedToGetMovies(with error: String) {
        self.error = error
    }
}
