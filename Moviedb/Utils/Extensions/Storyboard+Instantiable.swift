//
//  Storyboard+Instantiable.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import UIKit

extension UIStoryboard {
    enum Storyboard: String {
        case MoviesList
        case MovieDetails

        var fileName: String {
            return rawValue
        }
    }

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.fileName, bundle: bundle)
    }

    func instantiateViewController<T>() -> T where T: StoryboardInstantiable {
        guard let viewController = instantiateViewController(identifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier)")
        }
        return viewController
    }
}
