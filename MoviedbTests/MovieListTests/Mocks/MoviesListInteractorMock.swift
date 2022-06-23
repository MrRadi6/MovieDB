//
//  MoviesListInteractorMock.swift
//  MoviedbTests
//
//  Created by Samir on 6/23/22.
//

import Foundation
@testable import Moviedb

class MoviesListInteractorMock: MoviesListPresenterToInteractorProtocol {
    var isGetTopRatedMoviesCalled = false
    var isGetMoreTopRatedMoviesCalled = false
    var isGetMostPopularMoviesCalled = false
    var isGetMoreMostPopularMoviedCalled = false
    var hasMoreMovies: Bool?
    var movieId = 1
    var movieIndex: Int?

    func getTopRatedMovies() {
        isGetTopRatedMoviesCalled = true
    }

    func getMostPopularMovies() {
        isGetMostPopularMoviesCalled = true
    }

    func getMoreTopRatedMovies() {
        isGetMoreTopRatedMoviesCalled = true
    }

    func getMoreMostPopularMovies() {
        isGetMoreMostPopularMoviedCalled = true
    }

    func canFetchMoreMovies() -> Bool {
        return hasMoreMovies ?? false
    }

    func getMovieId(at index: Int) -> Int {
        self.movieIndex = index
        return movieId
    }
}
