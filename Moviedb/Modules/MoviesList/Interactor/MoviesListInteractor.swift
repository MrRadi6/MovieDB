//
//  MoviesListInteractor.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import Foundation

class MoviesListInteractor {
    let repository: MovieRepositoryProtocol
    private var page: MoviesPage?

    weak var presenter: MoviesListInteractorToPresenterProtocol!

    init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }

}

// MARK: - Conforming to MoviesListPresenterToInteractorProtocol
extension MoviesListInteractor: MoviesListPresenterToInteractorProtocol {
    func getMovies() {
        repository.getMovies() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let page):
                self.page = page
                self.presenter.didGetMovies(page.movies)
            case .failure(let error):
                self.presenter.failedToGetMovies(with: error.message)
            }
        }
    }

    func getMovieId(at index: Int) -> Int {
        guard let page = page else { return 0 }
        return page.movies[index].id
    }
}
