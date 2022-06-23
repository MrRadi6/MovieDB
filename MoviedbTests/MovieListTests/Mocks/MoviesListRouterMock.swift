//
//  MoviesListRouterMock.swift
//  MoviedbTests
//
//  Created by Samir on 6/23/22.
//

import Foundation
@testable import Moviedb

class MoviesListRouterMock: MoviesListPresenterToRouterProtocol {
    var movieId: Int?

    func openMovieDetails(with movieId: Int) {
        self.movieId = movieId
    }
}
