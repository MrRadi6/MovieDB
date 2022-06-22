//
//  MoviesListViewController.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import UIKit

class MoviesListViewController: BaseViewController {

    @IBOutlet weak private var moviesCollectionView: UICollectionView!
    private let refreshControl = UIRefreshControl()

    private var movies: [MovieViewModel] = []

    var presenter: MoviesListViewToPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }

    private func setupUI() {
        setupSortBarButton()
        setupMoviesCollectionView()
    }

    private func setupSortBarButton() {
        let sortBarButtonItem = UIBarButtonItem(image: .sort,
                                                style: .plain,
                                                target: self,
                                                action: #selector(handleSortButtonPressed))
        navigationItem.rightBarButtonItems = [sortBarButtonItem]
    }

    @objc private func handleSortButtonPressed() {
        let popularAction = UIAlertAction(title: "movie_list_popular_sort".localized(),
                                          style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.presenter.changeMovieFilter(to: .mostPopular)
        }
        let mostRatedAction = UIAlertAction(title: "movie_list_rate_sort".localized(),
                                            style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.presenter.changeMovieFilter(to: .topRated)
        }
        showActionSheet(actions: [popularAction, mostRatedAction])
    }

    private func setupMoviesCollectionView() {
        moviesCollectionView.registerCellType(MovieCollectionViewCell.self)
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        moviesCollectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleReloadMovies),
                                 for: .valueChanged)
    }

    @objc private func handleReloadMovies() {
        presenter.reloadMovies()
    }
}

extension MoviesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = view.frame.width
        let itemWidth = screenWidth * 0.46
        let itemHeight = itemWidth * 1.7
        return CGSize(width: itemWidth, height: itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

// MARK: - Conforming to UICollectionViewDataSource
extension MoviesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: MovieCollectionViewCell = collectionView.dequeueCell(indexPath: indexPath) else {
            fatalError()
        }
        let movie = movies[indexPath.item]
        cell.bind(with: movie)
        return cell
    }
}

// MARK: - Conforming to UICollectionViewDelegate
extension MoviesListViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectMovie(at: indexPath.item)
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        if indexPath.item == movies.count - 2 {
            presenter.getMoreMovies()
        }
    }
}

// MARK: - Conforming to MoviesListPresenterToViewProtocol
extension MoviesListViewController: MoviesListPresenterToViewProtocol {
    func loadView(with movies: [MovieViewModel]) {
        self.movies = movies
        self.refreshControl.endRefreshing()
        moviesCollectionView.reloadData()
    }

    func appendMovies(with movies: [MovieViewModel]) {
        self.movies.append(contentsOf: movies)
        moviesCollectionView.reloadData()
    }
}
