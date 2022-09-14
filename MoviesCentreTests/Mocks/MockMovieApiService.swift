//
//  MockMovieApiService.swift
//  MoviesCentreTests
//
//  Created by Sajeev S on 14/09/22.
//

import Foundation

@testable import MoviesCentre

class MockMovieApiService: ApiServiceProtocol {
    
    var getMovieIsCalled: Bool = false
    
    func getMovies(completion: @escaping ([Movie]?, Error?) -> Void) {
        self.getMovieIsCalled = true
    }
    
    
}
