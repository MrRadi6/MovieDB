//
//  MoviesListInteractorTests.swift
//  MoviedbTests
//
//  Created by Samir on 6/23/22.
//

import XCTest
@testable import Moviedb

class MoviesListInteractorTests: XCTestCase {

    var sut: MoviesListInteractor!
    var presenter: MoviesListPresenterMock!
    var repository: MovieRepositoryMock!

    override func setUp() {
        super.setUp()
        initModule()
    }

    override func tearDown() {
        super.tearDown()
        deinitModule()
    }

    func testGetMostPopularMoviesSuccess() {
        // Given
        let page = MoviesMocks.moviePage
        repository.moviesPage = page
        // When
        sut.getMostPopularMovies()
        // Then
        XCTAssertEqual(presenter.movies, page.movies)
    }

    func testGetMostPopularMoviesFailed() {
        // Given
        let error = BaseError.unknown
        repository.error = error
        // When
        sut.getMostPopularMovies()
        // Then
        XCTAssertEqual(presenter.error, error.message)
    }

    func testGetMoreMostPopularMoviesSuccess() {
        // Given
        let page = MoviesMocks.moviePage
        repository.moviesPage = page
        // When
        sut.getMoreMostPopularMovies()
        // Then
        XCTAssertEqual(presenter.movies, page.movies)
    }

    func testGetMoreMostPopularMoviesFailed() {
        // Given
        let error = BaseError.unknown
        repository.error = error
        // When
        sut.getMoreMostPopularMovies()
        // Then
        XCTAssertEqual(presenter.error, error.message)
    }

    func testGetTopRatedMoviesSuccess() {
        // Given
        let page = MoviesMocks.moviePage
        repository.moviesPage = page
        // When
        sut.getTopRatedMovies()
        // Then
        XCTAssertEqual(presenter.movies, page.movies)
    }

    func testGetTopRatedMoviesFailed() {
        // Given
        let error = BaseError.unknown
        repository.error = error
        // When
        sut.getTopRatedMovies()
        // Then
        XCTAssertEqual(presenter.error, error.message)
    }

    func testGetMoreTopRatedMoviesSuccess() {
        // Given
        let page = MoviesMocks.moviePage
        repository.moviesPage = page
        // When
        sut.getMoreTopRatedMovies()
        // Then
        XCTAssertEqual(presenter.movies, page.movies)
    }

    func testGetMoreTopRatedMoviesFailed() {
        // Given
        let error = BaseError.unknown
        repository.error = error
        // When
        sut.getMoreTopRatedMovies()
        // Then
        XCTAssertEqual(presenter.error, error.message)
    }

    func testCanFetchMoreWithMoreResultAvailable() {
        // Given
        let page = MoviesMocks.moviePage
        repository.moviesPage = page
        // When
        sut.getTopRatedMovies()
        let hasMorePages = sut.canFetchMoreMovies()
        // Then
        XCTAssertTrue(hasMorePages)
    }

    func testCanFetchMoreWithNoMoreResultAvailable() {
        // Given
        let page = MoviesMocks.moviePageNoMoreResults
        repository.moviesPage = page
        // When
        sut.getTopRatedMovies()
        let hasMorePages = sut.canFetchMoreMovies()
        // Then
        XCTAssertFalse(hasMorePages)
    }
}

// MARK: - Module Initialization
extension MoviesListInteractorTests {
    func initModule() {
        repository = MovieRepositoryMock()
        presenter = MoviesListPresenterMock()
        sut = MoviesListInteractor(repository: repository)
        sut.presenter = presenter
    }

    func deinitModule() {
        repository = nil
        presenter = nil
        sut = nil
    }
}
