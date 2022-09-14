//
//  MovieViewModelTests.swift
//  MoviesCentreTests
//
//  Created by Sajeev S on 14/09/22.
//

import XCTest

@testable import MoviesCentre

class MovieViewModelTests: XCTestCase {

    var sut: MovieViewModel!
    var mockMovieApi: MockMovieApiService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testShouldGetMoviesListWhenAPIIsCalled() {
        let promise = expectation(description: "API call is invoked")
        mockMovieApi = MockMovieApiService()
        sut = MovieViewModel(movieApi: mockMovieApi)
        
        sut.loadMovies()
        
        XCTAssertTrue(mockMovieApi.getMovieIsCalled == true)
        promise.fulfill()
        
        wait(for: [promise], timeout: 5)
    }
    
}
