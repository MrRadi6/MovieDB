//
//  MovieRepositoryMock.swift
//  MoviedbTests
//
//  Created by Samir on 6/23/22.
//

import Foundation
@testable import Moviedb

class MovieRepositoryMock: MovieRepositoryProtocol {
    var moviesPage: MoviesPage?
    var movieDetails: MovieDetails?
    var error: BaseError?

    func getPopularMovies(with page: Int, completion: @escaping (Result<MoviesPage, BaseError>) -> Void) {
        if let moviesPage = moviesPage {
            completion(.success(moviesPage))
        } else if let error = error {
            completion(.failure(error))
        }
    }

    func getTopRatedMovies(with page: Int, completion: @escaping (Result<MoviesPage, BaseError>) -> Void) {
        if let moviesPage = moviesPage {
            completion(.success(moviesPage))
        } else if let error = error {
            completion(.failure(error))
        }
    }

    func getMovieDetails(with id: Int, completion: @escaping (Result<MovieDetails, BaseError>) -> Void) {
        if let movieDetails = movieDetails {
            completion(.success(movieDetails))
        } else if let error = error {
            completion(.failure(error))
        }
    }

    
}
