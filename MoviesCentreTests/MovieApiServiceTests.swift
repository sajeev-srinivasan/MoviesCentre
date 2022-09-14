//
//  MovieApiServiceTests.swift
//  MoviesCentreTests
//
//  Created by Sajeev S on 14/09/22.
//

import XCTest

@testable import MoviesCentre
import SwiftUI

class MovieApiServiceTests: XCTestCase {

    var sut: MovieApiService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testShouldGetMoviesIfAPIIsHit() {
        let promise = expectation(description: "Movies list is recieved")
        let url = URL(string: Api.moviesEndPoint)
        let data = TestConstants.movieData
        let response = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: nil, headerFields: nil)
        let session = URLSessionStub(data: data, response: response, error: nil)
        sut = MovieApiService(session: session)
        
        sut.getMovies{
            (data: [Movie]?, error: Error?) -> Void in
            if let data = data {
                print(TestConstants.movies)
                XCTAssertTrue(data == TestConstants.movies)
                promise.fulfill()
            }
            
            if let error = error {
                print(error)
                XCTFail()
            }
        }
        wait(for: [promise], timeout: 5)
    }
    
    func testShouldGetEmptyDataErrorIfThereIsNoDataInResponse(){
        let promise = expectation(description: "Movies list is recieved")
        let url = URL(string: Api.moviesEndPoint)
        let response = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: nil, headerFields: nil)
        let session = URLSessionStub(data: nil, response: response, error: nil)
        sut = MovieApiService(session: session)
        
        sut.getMovies{
            (data: [Movie]?, error: Error?) -> Void in
            if let error = error as? ApiServiceError {
                switch error {
                case .emptyData:
                    promise.fulfill()
                }
            }
        }
        wait(for: [promise], timeout: 5)
    }
}
