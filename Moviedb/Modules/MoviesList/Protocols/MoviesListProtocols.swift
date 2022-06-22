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
    func getMoreMovies()
    func changeMovieFilter(to filter: MovieSortType)
    func didSelectMovie(at index: Int)
}

protocol MoviesListPresenterToViewProtocol: PresenterToViewProtocol {
    func loadView(with movies: [MovieViewModel])
    func appendMovies(with movies: [MovieViewModel])
}

protocol MoviesListPresenterToInteractorProtocol {
    func getTopRatedMovies()
    func getMostPopularMovies()
    func getMoreTopRatedMovies()
    func getMoreMostPopularMovies()
    func canFetchMoreMovies() -> Bool
    func getMovieId(at index: Int) -> Int
}

protocol MoviesListInteractorToPresenterProtocol: AnyObject {
    func didGetTopRatedMovies(_ movies: [Movie])
    func didGetMoreTopRatedMovies(_ movies: [Movie])
    func didGetMostPopularMovies(_ movies: [Movie])
    func didGetMoreMostPopularMovies(_ movies: [Movie])
    func failedToGetMovies(with error: String)
}

protocol MoviesListPresenterToRouterProtocol {
    func openMovieDetails(with movieId: Int)
}

enum MovieSortType {
    case topRated
    case mostPopular
}
