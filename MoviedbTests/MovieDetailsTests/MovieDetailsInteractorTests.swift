//
//  MovieDetailsInteractorTests.swift
//  MoviedbTests
//
//  Created by Samir on 6/24/22.
//

import XCTest
@testable import Moviedb

class MovieDetailsInteractorTests: XCTestCase {

    var sut: MovieDetailsInteractor!
    var presenter: MovieDetailsPresenterMock!
    var repository: MovieRepositoryMock!

    override func setUp() {
        super.setUp()
        initModule()
    }

    override func tearDown() {
        super.tearDown()
        deinitModule()
    }

    func testGetMovieDetailsSuccessfully() {
        // Given
        let movie = MoviesMocks.movieDetails
        repository.movieDetails = movie
        // When
        sut.getMovieDetails(with: MoviesMocks.movie.id)
        // Then
        XCTAssertEqual(presenter.movie, movie)
    }

    func testGetMovieDetailsFailure() {
        // Given
        let error: BaseError = .unknown
        repository.error = error
        // When
        sut.getMovieDetails(with: MoviesMocks.movie.id)
        // Then
        XCTAssertEqual(presenter.error, error.message)
    }
}

// MARK: - Module Initialization
extension MovieDetailsInteractorTests {
    func initModule() {
        repository = MovieRepositoryMock()
        presenter = MovieDetailsPresenterMock()
        sut = MovieDetailsInteractor(repository: repository)
        sut.presenter = presenter
    }

    func deinitModule() {
        repository = nil
        presenter = nil
        sut = nil
    }
}
