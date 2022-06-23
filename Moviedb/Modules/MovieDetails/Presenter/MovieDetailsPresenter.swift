//
//  MovieDetailsPresenter.swift
//  Moviedb
//
//  Created by Samir on 6/23/22.
//

import Foundation

class MovieDetailsPresenter {

    private let view: MovieDetailsPresenterToViewProtocol
    private let interactor: MovieDetailsPresenterToInteractorProtocol

    var movieId: Int?

    init(view: MovieDetailsPresenterToViewProtocol,
         interactor: MovieDetailsPresenterToInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }

}

// MARK: - Conforming to MovieDetailsViewToPresenterProtocol
extension MovieDetailsPresenter: MovieDetailsViewToPresenterProtocol {
    func viewDidAppear() {
        guard let movieId = movieId else { return }
        view.showLoadingView()
        interactor.getMovieDetails(with: movieId)
    }
}

// MARK: - Conforming to MovieDetailsInteractorToPresenterProtocol
extension MovieDetailsPresenter: MovieDetailsInteractorToPresenterProtocol {
    func didGetMovieDetails(_ movie: MovieDetails) {
        view.hideLoadingView { [unowned self] in
            self.view.updateView(with: MovieDetailsViewModel(movie: movie))
        }
    }

    func failedToGetMovieDetails(with error: String) {
        view.hideLoadingView { [unowned self] in
            self.view.showErrorMessage(title: nil, error: error)
        }
    }
}
