//
//  StoryboardInstantiable.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import UIKit

protocol StoryboardInstantiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardInstantiable where Self: UIViewController {

    static var storyboardIdentifier: String {
        return String(describing: self)
    }

    static func instantiate(from storyboard: UIStoryboard.Storyboard) -> Self {
        return UIStoryboard(storyboard: storyboard).instantiateViewController(identifier: Self.storyboardIdentifier)
    }
}

