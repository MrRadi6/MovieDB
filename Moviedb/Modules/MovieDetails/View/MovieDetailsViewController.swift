//
//  MovieDetailsViewController.swift
//  Moviedb
//
//  Created by Samir on 6/23/22.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: BaseViewController {

    @IBOutlet weak private var movieImageView: UIImageView!
    @IBOutlet weak private var movieTitleLabel: UILabel!
    @IBOutlet weak private var movieReleaseDate: UILabel!
    @IBOutlet weak private var userScoreTitleLabel: UILabel!
    @IBOutlet weak private var userScoreProgressView: UIProgressView!
    @IBOutlet weak private var userScoreLabel: UILabel!
    @IBOutlet weak private var totalVoteCountLabel: UILabel!
    @IBOutlet weak private var overviewTitleLabel: UILabel!
    @IBOutlet weak private var overviewLabel: UILabel!

    var presenter: MovieDetailsViewToPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }

    private func setupUI() {
        userScoreTitleLabel.text = "movie_details_user_score_label".localized()
        overviewTitleLabel.text = "movie_details_overview_label".localized()
    }
}

// MARK: - MovieDetailsPresenterToViewProtocol
extension MovieDetailsViewController: MovieDetailsPresenterToViewProtocol {
    func updateView(with movie: MovieDetailsViewModel) {
        setMovieImageView(with: movie.imageUrl)
        movieTitleLabel.text = movie.title
        movieReleaseDate.text = movie.releaseDate
        userScoreProgressView.progress = (movie.rating / 100)
        userScoreLabel.text = "\(movie.rating)%"
        totalVoteCountLabel.text = "(\(movie.totalVotes))"
        overviewLabel.text = movie.overview

    }

    private func setMovieImageView(with urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        movieImageView.kf.setImage(with: url)
    }
}
