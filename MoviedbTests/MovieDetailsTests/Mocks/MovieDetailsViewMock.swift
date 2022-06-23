//
//  MovieDetailsViewMock.swift
//  MoviedbTests
//
//  Created by Samir on 6/24/22.
//

import Foundation
@testable import Moviedb

class MovieDetailsViewMock: BaseViewMock, MovieDetailsPresenterToViewProtocol {
    var movie: MovieDetailsViewModel?

    func updateView(with movie: MovieDetailsViewModel) {
        self.movie = movie
    }
}
