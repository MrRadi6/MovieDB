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
    func getTopRatedMovies() {
        repository.getTopRatedMovies(with: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let page):
                self.page = page
                self.presenter.didGetTopRatedMovies(page.movies)
            case .failure(let error):
                self.presenter.failedToGetMovies(with: error.message)
            }
        }
    }

    func getMostPopularMovies() {
        repository.getPopularMovies(with: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let page):
                self.page = page
                self.presenter.didGetMostPopularMovies(page.movies)
            case .failure(let error):
                self.presenter.failedToGetMovies(with: error.message)
            }
        }
    }

    func getMoreTopRatedMovies() {
        let nextPage = (page?.number ?? 0) + 1
        repository.getTopRatedMovies(with: nextPage) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let page):
                self.page = page
                self.presenter.didGetMoreTopRatedMovies(page.movies)
            case .failure(let error):
                self.presenter.failedToGetMovies(with: error.message)
            }
        }
    }

    func getMoreMostPopularMovies() {
        let nextPage = (page?.number ?? 0) + 1
        repository.getPopularMovies(with: nextPage) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let page):
                self.page = page
                self.presenter.didGetMoreMostPopularMovies(page.movies)
            case .failure(let error):
                self.presenter.failedToGetMovies(with: error.message)
            }
        }
    }

    func canFetchMoreMovies() -> Bool {
        guard let page = page else { return false}
        return page.number < page.totalPages
    }

    func getMovieId(at index: Int) -> Int {
        guard let page = page else { return 0 }
        return page.movies[index].id
    }
}
