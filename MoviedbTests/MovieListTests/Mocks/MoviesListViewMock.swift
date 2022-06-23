//
//  MoviesListViewMock.swift
//  MoviedbTests
//
//  Created by Samir on 6/23/22.
//

import Foundation
@testable import Moviedb

class MoviesListViewMock:BaseViewMock, MoviesListPresenterToViewProtocol {
    var movies: [MovieViewModel]?

    func loadView(with movies: [MovieViewModel]) {
        self.movies = movies
    }

    func appendMovies(with movies: [MovieViewModel]) {
        self.movies?.append(contentsOf: movies)
    }
}
