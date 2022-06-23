//
//  MovieDetailsProtocols.swift
//  Moviedb
//
//  Created by Samir on 6/23/22.
//

import Foundation

protocol MovieDetailsViewToPresenterProtocol {
    func viewDidAppear()
}

protocol MovieDetailsPresenterToViewProtocol: PresenterToViewProtocol {
    func updateView(with movie: MovieDetailsViewModel)
}

protocol MovieDetailsPresenterToInteractorProtocol {
    func getMovieDetails(with movieId: Int)
}

protocol MovieDetailsInteractorToPresenterProtocol: AnyObject {
    func didGetMovieDetails(_ movie: MovieDetails)
    func failedToGetMovieDetails(with error: String)
}
