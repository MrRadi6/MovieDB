//
//  MoviesListRouter.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import Foundation
import UIKit

class MoviesListRouter {
    weak var viewController: UIViewController?

    static func createModule() -> MoviesListViewController {
        let view = MoviesListViewController.instantiate(from: .MoviesList)
        let interactor = MoviesListInteractor(repository: MovieRepository(remote: MovieAPI()))
        let router = MoviesListRouter()
        let presenter = MoviesListPresenter(view: view,
                                            interactor: interactor,
                                            router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        
        router.viewController = view
        return view
    }
}

extension MoviesListRouter: MoviesListPresenterToRouterProtocol {
    func openMovieDetails(with movieId: Int) {
        dLog(movieId)
    }
}
