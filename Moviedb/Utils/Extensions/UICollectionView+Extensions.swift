//
//  UICollectionView+Extensions.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import UIKit

extension UICollectionView {
    func registerCellType<T: UICollectionViewCell>(_ type: T.Type) {
        register(UINib(nibName: type.nibName, bundle: nil), forCellWithReuseIdentifier: type.identifier)
    }

    func dequeueCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T
    }
}
