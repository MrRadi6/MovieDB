//
//  LoadingViewController.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import UIKit

class LoadingViewController: UIViewController {

    private var activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .white
        view.hidesWhenStopped = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "23242B80")
        activityView.center = view.center
        view.addSubview(activityView)
    }

    func startAnimating() {
        activityView.startAnimating()
    }

    func stopAnimating() {
        activityView.stopAnimating()
    }
}
