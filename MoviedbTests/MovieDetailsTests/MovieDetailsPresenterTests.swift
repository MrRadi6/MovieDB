//
//  MovieDetailsPresenterTests.swift
//  MoviedbTests
//
//  Created by Samir on 6/24/22.
//

import XCTest
@testable import Moviedb

class MovieDetailsPresenterTests: XCTestCase {

    var sut: MovieDetailsPresenter!
    var view: MovieDetailsViewMock!
    var interactor: MovieDetailsInteractorMock!

    override func setUp() {
        super.setUp()
        initModule()
    }

    override func tearDown() {
        super.tearDown()
        deinitModule()
    }
    
    func testViewDidAppear() {
        // Given
        let movieId = MoviesMocks.movie.id
        sut.movieId = movieId
        // When
        sut.viewDidAppear()
        // Then
        XCTAssertTrue(view.isLoaderPresented)
        XCTAssertEqual(interactor.movieId, movieId)
    }

    func testDidGetMovieDetails() {
        // Given
        let movie = MoviesMocks.movieDetails
        let dateString = DateManager.getMonthDayYear(from: movie.releaseDate)
        // When
        sut.didGetMovieDetails(movie)
        // Then
        XCTAssertTrue(view.isLoaderDismissed)
        XCTAssertEqual(view.movie?.title, movie.title)
        XCTAssertEqual(view.movie?.releaseDate, dateString)
        XCTAssertEqual(view.movie?.rating, movie.rating * 10)
        XCTAssertEqual(view.movie?.imageUrl, movie.posterPath)
        XCTAssertEqual(view.movie?.overview, movie.overview)
        XCTAssertEqual(view.movie?.totalVotes, movie.totalVotes)
    }

    func testFailedToGetMovieDetails() {
        // Given
        let error = "error message"
        // When
        sut.failedToGetMovieDetails(with: error)
        // Then
        XCTAssertTrue(view.isLoaderDismissed)
        XCTAssertEqual(view.error?.message, error)
    }
}

// MARK: - Module Initialization
extension MovieDetailsPresenterTests {
    func initModule() {
        view = MovieDetailsViewMock()
        interactor = MovieDetailsInteractorMock()
        sut = MovieDetailsPresenter(view: view,
                                    interactor: interactor)
    }

    func deinitModule() {
        view = nil
        interactor = nil
        sut = nil
    }
}
