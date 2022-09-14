//
//  MovieApiServiceTests.swift
//  MoviesCentreTests
//
//  Created by Sajeev S on 14/09/22.
//

import XCTest

@testable import MoviesCentre

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
        let request = URLRequest(url: URL(string: Api.moviesEndPoint)!)
        
    }
}
