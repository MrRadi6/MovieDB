//
//  MovieDetailsRouter.swift
//  Moviedb
//
//  Created by Samir on 6/23/22.
//

import Foundation
import UIKit

class MovieDetailsRouter {
    
    static func createModule(with movieId: Int) -> MovieDetailsViewController {
        let view = MovieDetailsViewController.instantiate(from: .MovieDetails)
        let interactor = MovieDetailsInteractor(repository: MovieRepository(remote: MovieAPI()))
        let presenter = MovieDetailsPresenter(view: view,
                                              interactor: interactor)
        presenter.movieId = movieId
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
}
