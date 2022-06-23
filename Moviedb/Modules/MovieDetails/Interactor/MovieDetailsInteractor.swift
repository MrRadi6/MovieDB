//
//  MovieDetailsInteractor.swift
//  Moviedb
//
//  Created by Samir on 6/23/22.
//

import Foundation

class MovieDetailsInteractor {
    let repository: MovieRepositoryProtocol

    weak var presenter: MovieDetailsInteractorToPresenterProtocol!

    init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
}

// MARK: - Conforming to MovieDetailsPresenterToInteractorProtocol
extension MovieDetailsInteractor: MovieDetailsPresenterToInteractorProtocol {
    func getMovieDetails(with movieId: Int) {
        repository.getMovieDetails(with: movieId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movieDetails):
                self.presenter.didGetMovieDetails(movieDetails)
            case .failure(let error):
                self.presenter.failedToGetMovieDetails(with: error.message)
            }
        }
    }
}
