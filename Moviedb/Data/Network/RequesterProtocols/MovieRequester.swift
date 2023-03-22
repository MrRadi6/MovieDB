//
//  MovieRequester.swift
//  Moviedb
//
//  Created by Samir on 6/21/22.
//

import Foundation

protocol MovieRequester {
    func getPopularMovies(with page: Int, completion: @escaping (Result<MoviesDTO, BaseError>) -> Void)
    func getTopRatedMovies(with page: Int, completion: @escaping (Result<MoviesDTO, BaseError>) -> Void)
    func getMovies(with page: Int, completion: @escaping (Result<MoviesDTO, BaseError>) -> Void)
    func getMovieDetails(with id: Int, completion: @escaping (Result<MovieDetailsDTO, BaseError>) -> Void)
}
