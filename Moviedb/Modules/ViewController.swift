//
//  ViewController.swift
//  Moviedb
//
//  Created by Samir on 6/20/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let repo = MovieRepository(remote: MovieAPI())
        repo.getMovieDetails(with: 278) { result in
            switch result {
            case .success(let details):
                dLog(details)
            case .failure(let error):
                dLog(error)
            }
        }
    }


}

