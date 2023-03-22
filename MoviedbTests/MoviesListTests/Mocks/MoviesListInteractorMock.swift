//
//  MoviesListInteractorMock.swift
//  MoviedbTests
//
//  Created by Samir on 6/23/22.
//

import Foundation
@testable import Moviedb

class MoviesListInteractorMock: MoviesListPresenterToInteractorProtocol {
    var getMoviesCount = 0
    var hasMoreMovies: Bool?
    var movieId = 1
    var movieIndex: Int?

    func getMovies() {
        getMoviesCount += 1
    }

    func getMovieId(at index: Int) -> Int {
        self.movieIndex = index
        return movieId
    }
}
