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

    }

    private func setRootView(_ viewController: UIViewController) {
        guard let window = window else { return }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
