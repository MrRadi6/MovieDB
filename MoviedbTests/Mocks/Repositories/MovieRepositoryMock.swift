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

    func getMovies(completion: @escaping (Result<Moviedb.MoviesPage, Moviedb.BaseError>) -> Void) {
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
