//
//  MovieRepository.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getMovies(completion: @escaping (Result<MoviesPage, BaseError>) -> Void)
    func getMovieDetails(with id: Int, completion: @escaping (Result<MovieDetails, BaseError>) -> Void)
}

struct MovieRepository: MovieRepositoryProtocol {


    let remote: MovieRequester

    func getMovies(completion: @escaping (Result<MoviesPage, BaseError>) -> Void) {
        remote.getMovies(with: 1) { result in
            switch result {
            case .success(let moviesDTO):
                let movies = moviesDTO.transferToMoviesPage()
                completion(.success(movies))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getMovieDetails(with id: Int, completion: @escaping (Result<MovieDetails, BaseError>) -> Void) {
        remote.getMovieDetails(with: id) { result in
            switch result {
            case .success(let movieDetailsDTO):
                let movieDetails = movieDetailsDTO.transferToMovieDetails()
                completion(.success(movieDetails))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
