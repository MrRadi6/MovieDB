//
//  MovieAPI.swift
//  Moviedb
//
//  Created by Samir on 6/21/22.
//

import Foundation

struct MovieAPI: BaseAPI, MovieRequester {
    func getPopularMovies(with page: Int, completion: @escaping (Result<MoviesDTO, BaseError>) -> Void) {
        makeAuthRequest(request: MoviesRequest.popular(page: page), completion: completion)
    }

    func getTopRatedMovies(with page: Int, completion: @escaping (Result<MoviesDTO, BaseError>) -> Void) {
        makeAuthRequest(request: MoviesRequest.topRated(page: page), completion: completion)
    }

    func getMovieDetails(with id: Int, completion: @escaping (Result<MovieDetailsDTO, BaseError>) -> Void) {
        makeAuthRequest(request: MoviesRequest.details(id: id), completion: completion)
    }


}
