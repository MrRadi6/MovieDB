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

    func testGetMoviesSuccess() {
        // Given
        let page = MoviesMocks.moviePage
        repository.moviesPage = page
        // When
        sut.getMovies()
        // Then
        XCTAssertEqual(presenter.movies, page.movies)
    }

    func testGetMostPopularMoviesFailed() {
        // Given
        let error = BaseError.unknown
        repository.error = error
        // When
        sut.getMovies()
        // Then
        XCTAssertEqual(presenter.error, error.message)
    }

    func testGetMovieIdAtIndex() {
        // Given
        let page = MoviesMocks.moviePage
        repository.moviesPage = page
        sut.getMovies()
        // When
        let id = sut.getMovieId(at: 0)
        // Then
        XCTAssertEqual(id, page.movies[0].id)
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
