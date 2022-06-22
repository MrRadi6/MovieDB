//
//  BaseViewController.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import UIKit

class BaseViewController: UIViewController {
    private var loadingView: LoadingViewController?
}

// MARK: - Conforming to BaseInteractorToPresenter
extension BaseViewController: PresenterToViewProtocol {

    func showLoadingView() {
        loadingView = LoadingViewController()
        loadingView!.modalPresentationStyle = .overFullScreen
        loadingView!.modalTransitionStyle = .crossDissolve
        present(loadingView!, animated: true)
        loadingView!.startAnimating()
    }

    func hideLoadingView(completion: (() -> Void)?) {
        guard let loadingView = loadingView else {
            completion?()
            return
        }
        loadingView.stopAnimating()
        loadingView.dismiss(animated: false) {
            completion?()
        }
        self.loadingView = nil
    }
}
