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
        XCTAssertEqual(interactor.getMoviesCount, 1)
        XCTAssertTrue(view.isLoaderPresented)
    }

    func testReloadMovies() {
        // When
        sut.reloadMovies()
        // Then
        XCTAssertEqual(interactor.getMoviesCount, 1)
        XCTAssertFalse(view.isLoaderPresented)
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

    func testDidGetMovies() {
        // Given
        let movies: [Movie] = [MoviesMocks.movie]
        let dateString = DateManager.getMonthDayYear(from: movies[0].releaseDate)
        // When
        sut.didGetMovies(movies)
        // Then
        XCTAssertTrue(view.isLoaderDismissed)
        XCTAssertEqual(view.movies?[0].title, movies[0].title)
        XCTAssertEqual(view.movies?[0].imageUrl, movies[0].posterPath)
        XCTAssertEqual(view.movies?[0].releaseDate, dateString)
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
