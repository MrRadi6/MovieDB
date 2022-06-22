//
//  ApplicationFlow.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import UIKit

class ApplicationFlow {

    var window: UIWindow?

    static var shared = ApplicationFlow()

    func launchApp() {
        showMoviesList()
    }

    func showMoviesList() {
        let moviesList = MoviesListRouter.createModule()
        let navigationController = UINavigationController(rootViewController: moviesList)
        setRootView(navigationController)
    }

    private func setRootView(_ viewController: UIViewController) {
        guard let window = window else { return }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
