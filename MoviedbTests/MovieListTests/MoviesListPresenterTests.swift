//
//  MoviesListPresenterTests.swift
//  MoviedbTests
//
//  Created by Samir on 6/23/22.
//

import XCTest
@testable import Moviedb

class MoviesListPresenterTests: XCTestCase {

    var sut: MoviesListPresenter!
    var view: MoviesListViewMock!
    var interactor: MoviesListInteractorMock!
    var router: MoviesListRouterMock!

    override func setUp() {
        super.setUp()
        initModule()
    }

    override func tearDown() {
        super.tearDown()
        deinitModule()
    }

    func testViewDidAppear() {
        // When
        sut.viewDidAppear()
        // Then
        XCTAssertTrue(interactor.isGetMostPopularMoviesCalled)
        XCTAssertTrue(view.isLoaderPresented)
    }

    func testReloadMovies() {
        // When
        sut.reloadMovies()
        // Then
        XCTAssertTrue(interactor.isGetMostPopularMoviesCalled)
        XCTAssertFalse(view.isLoaderPresented)
    }

    func testGetMoreMovies() {
        // Given
        sut.changeMovieFilter(to: .topRated)
        // When
        sut.getMoreMovies()
        // Then
        XCTAssertTrue(interactor.isGetMoreTopRatedMoviesCalled)
    }

    func testDidSelectMovie() {
        // Given
        let movieIndex = 1
        let movieId = 122
        interactor.movieId = movieId
        // When
        sut.didSelectMovie(at: movieIndex)
        // Then
        XCTAssertEqual(interactor.movieIndex, movieIndex)
        XCTAssertEqual(router.movieId, movieId)
    }

    func testDidGetTopRatedMovies() {
        // Given
        let movies: [Movie] = [MoviesMocks.movie]
        let dateString = DateManager.getMonthDayYear(from: movies[0].releaseDate)
        // When
        sut.didGetTopRatedMovies(movies)
        // Then
        XCTAssertTrue(view.isLoaderDismissed)
        XCTAssertEqual(view.movies?[0].title, movies[0].title)
        XCTAssertEqual(view.movies?[0].imageUrl, movies[0].posterPath)
        XCTAssertEqual(view.movies?[0].releaseDate, dateString)
    }

    func testDidGetMoreTopRatedMovies() {
        // Given
        let movies: [Movie] = [MoviesMocks.movie]
        let dateString = DateManager.getMonthDayYear(from: movies[0].releaseDate)
        view.movies = [MovieViewModel(movie: MoviesMocks.movie)]
        // When
        sut.didGetMoreTopRatedMovies(movies)
        // Then
        XCTAssertEqual(view.movies?[1].title, movies[0].title)
        XCTAssertEqual(view.movies?[1].imageUrl, movies[0].posterPath)
        XCTAssertEqual(view.movies?[1].releaseDate, dateString)
    }

    func testDidGetMostPopularMovies() {
        // Given
        let movies: [Movie] = [MoviesMocks.movie]
        let dateString = DateManager.getMonthDayYear(from: movies[0].releaseDate)
        // When
        sut.didGetMostPopularMovies(movies)
        // Then
        XCTAssertTrue(view.isLoaderDismissed)
        XCTAssertEqual(view.movies?[0].title, movies[0].title)
        XCTAssertEqual(view.movies?[0].imageUrl, movies[0].posterPath)
        XCTAssertEqual(view.movies?[0].releaseDate, dateString)
    }

    func testDidGetMoreMostPopularMovies() {
        // Given
        let movies: [Movie] = [MoviesMocks.movie]
        let dateString = DateManager.getMonthDayYear(from: movies[0].releaseDate)
        view.movies = [MovieViewModel(movie: MoviesMocks.movie)]
        // When
        sut.didGetMoreMostPopularMovies(movies)
        // Then
        XCTAssertEqual(view.movies?[1].title, movies[0].title)
        XCTAssertEqual(view.movies?[1].imageUrl, movies[0].posterPath)
        XCTAssertEqual(view.movies?[1].releaseDate, dateString)
    }

    func testFailedToGetMovies() {
        // Given
        let error = "error message"
        // When
        sut.failedToGetMovies(with: error)
        // Then
        XCTAssertEqual(view.error?.message, error)
    }
}

// MARK: - Module Initialization
extension MoviesListPresenterTests {
    func initModule() {
        view = MoviesListViewMock()
        interactor = MoviesListInteractorMock()
        router = MoviesListRouterMock()
        sut = MoviesListPresenter(view: view,
                                  interactor: interactor,
                                  router: router)
    }

    func deinitModule() {
        view = nil
        interactor = nil
        router = nil
        sut = nil
    }
}
