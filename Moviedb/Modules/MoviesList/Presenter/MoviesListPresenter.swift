//
//  MoviesListPresenter.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import Foundation

class MoviesListPresenter {

    private let view: MoviesListPresenterToViewProtocol
    private let interactor: MoviesListPresenterToInteractorProtocol
    private let router: MoviesListPresenterToRouterProtocol

    private var currentSortType: MovieSortType = .mostPopular

    init(view: MoviesListPresenterToViewProtocol,
         interactor: MoviesListPresenterToInteractorProtocol,
         router: MoviesListPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    private func getMovies() {
        switch currentSortType {
        case .topRated:
            interactor.getTopRatedMovies()
        case .mostPopular:
            interactor.getMostPopularMovies()
        }
    }
}

// MARK: - Conforming to MoviesListViewToPresenterProtocol
extension MoviesListPresenter: MoviesListViewToPresenterProtocol {
    func viewDidAppear() {
        view.showLoadingView()
        getMovies()
    }

    func reloadMovies() {
        getMovies()
    }

    func getMoreMovies() {
        switch currentSortType {
        case .topRated:
            interactor.getMoreTopRatedMovies()
        case .mostPopular:
            interactor.getMoreTopRatedMovies()
        }
    }

    func changeMovieFilter(to filter: MovieSortType) {
        currentSortType = filter
        view.showLoadingView()
        getMovies()
    }

    func didSelectMovie(at index: Int) {
        let id = interactor.getMovieId(at: index)
        router.openMovieDetails(with: id)
    }
}

// MARK: - Conforming to MoviesListInteractorToPresenterProtocol
extension MoviesListPresenter: MoviesListInteractorToPresenterProtocol {
    func didGetTopRatedMovies(_ movies: [Movie]) {
        view.hideLoadingView { [unowned self] in
            self.view.loadView(with: self.getMovieViewModels(from: movies))
        }
    }

    func didGetMoreTopRatedMovies(_ movies: [Movie]) {
        view.hideLoadingView { [unowned self] in
            self.view.appendMovies(with: self.getMovieViewModels(from: movies))
        }
    }

    func didGetMostPopularMovies(_ movies: [Movie]) {
        view.hideLoadingView { [unowned self] in
            self.view.loadView(with: self.getMovieViewModels(from: movies))
        }
    }

    func didGetMoreMostPopularMovies(_ movies: [Movie]) {
        view.hideLoadingView { [unowned self] in
            self.view.appendMovies(with: self.getMovieViewModels(from: movies))
        }
    }

    func failedToGetMovies(with error: String) {
        view.hideLoadingView { [unowned self] in
            self.view.showErrorMessage(title: nil, error: error)
        }
    }

    private func getMovieViewModels(from movies: [Movie]) -> [MovieViewModel] {
        let viewModels = movies.map({ MovieViewModel(movie: $0)})
        return viewModels
    }

}
