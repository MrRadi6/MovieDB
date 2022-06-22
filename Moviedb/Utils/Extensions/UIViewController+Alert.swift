//
//  UIViewController+Alert.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import UIKit

extension UIViewController {
    func showErrorMessage(title: String?, error: String) {
        let alert = UIAlertController(title: title, message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "global_ok".localized(),
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

    func showActionSheet(title: String? = nil,
                         message: String? = nil,
                         actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .actionSheet)
        for action in actions {
            alert.addAction(action)
        }
        let dismissAction = UIAlertAction(title: "global_back".localized(),
                                          style: .cancel)
        alert.addAction(dismissAction)
        self.present(alert, animated: true, completion: nil)
    }
}

