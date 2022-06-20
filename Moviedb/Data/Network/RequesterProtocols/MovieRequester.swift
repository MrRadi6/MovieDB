//
//  MovieRequester.swift
//  Moviedb
//
//  Created by Samir on 6/21/22.
//

import Foundation

protocol MovieRequester {
    func getPopularMovies(with page: Int)
    func getTopRatedMovies(with page: Int)
    func getMovieDetails(with id: Int)
}
