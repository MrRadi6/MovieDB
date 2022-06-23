//
//  MovieDetailsInteractorMock.swift
//  MoviedbTests
//
//  Created by Samir on 6/24/22.
//

import Foundation
@testable import Moviedb

class MovieDetailsInteractorMock: MovieDetailsPresenterToInteractorProtocol {
    var movieId: Int?

    func getMovieDetails(with movieId: Int) {
        self.movieId = movieId
    }
}
