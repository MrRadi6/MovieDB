//
//  MovieDetailsPresenterMock.swift
//  MoviedbTests
//
//  Created by Samir on 6/24/22.
//

import Foundation
@testable import Moviedb

class MovieDetailsPresenterMock: MovieDetailsInteractorToPresenterProtocol {
    var movie: MovieDetails?
    var error: String?

    func didGetMovieDetails(_ movie: MovieDetails) {
        self.movie = movie
    }

    func failedToGetMovieDetails(with error: String) {
        self.error = error
    }
}
