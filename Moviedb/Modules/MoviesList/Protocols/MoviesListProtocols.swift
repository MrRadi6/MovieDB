//
//  MoviesListProtocols.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import Foundation

protocol MoviesListViewToPresenterProtocol {
    func viewDidAppear()
    func reloadMovies()
    func didSelectMovie(at index: Int)
}

protocol MoviesListPresenterToViewProtocol: PresenterToViewProtocol {
    func loadView(with movies: [MovieViewModel])
}

protocol MoviesListPresenterToInteractorProtocol {
    func getMovies()
    func getMovieId(at index: Int) -> Int
}

protocol MoviesListInteractorToPresenterProtocol: AnyObject {
    func didGetMovies(_ movies: [Movie])
    func failedToGetMovies(with error: String)
}

protocol MoviesListPresenterToRouterProtocol {
    func openMovieDetails(with movieId: Int)
}
