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


    init(view: MoviesListPresenterToViewProtocol,
         interactor: MoviesListPresenterToInteractorProtocol,
         router: MoviesListPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    private func getMovies() {
        interactor.getMovies()
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

    func didSelectMovie(at index: Int) {
        let id = interactor.getMovieId(at: index)
        router.openMovieDetails(with: id)
    }
}

// MARK: - Conforming to MoviesListInteractorToPresenterProtocol
extension MoviesListPresenter: MoviesListInteractorToPresenterProtocol {
    func didGetMovies(_ movies: [Movie]) {
        view.hideLoadingView(completion: nil)
        view.loadView(with: self.getMovieViewModels(from: movies))
    }
    
    private func getMovieViewModels(from movies: [Movie]) -> [MovieViewModel] {
        let viewModels = movies.map({ MovieViewModel(movie: $0)})
        return viewModels
    }

    func failedToGetMovies(with error: String) {
        view.hideLoadingView(completion: nil)
        view.showErrorMessage(title: nil, error: error)
    }

}
