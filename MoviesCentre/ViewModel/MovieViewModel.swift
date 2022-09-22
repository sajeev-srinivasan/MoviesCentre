//
//  MovieViewModel.swift
//  MoviesCentre
//
//  Created by Sajeev S on 14/09/22.
//

import Foundation

class MovieViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var isError: Bool = true
    @Published var errorMessage: String = ""
    
    private var movieApi: ApiServiceProtocol
    var navigationTitle: String = "Movie"
    var errorImage: String = "exclamationmark.triangle.fill"
    
    init(movieApi: ApiServiceProtocol = MovieApiService()) {
        self.movieApi = movieApi
        loadMovies()
    }
    
    func loadMovies(){
        movieApi.getMovies(completion: completionHandler)
    }
    
    private func completionHandler(data: [Movie]?, error: Error?) -> Void {
        
        guard let data = data else {
            
            if let error = error as? ApiServiceError {
                
                switch error {
                case .networkError:
                    setErrorMessage(errorText: "Check internet connectivity")
                    
                case .badServerResponse(statusCode: 500):
                    setErrorMessage(errorText: "Server error")
                    
                case .decodingError:
                    setErrorMessage(errorText: "Something went wrong")
                    
                case .emptyData:
                    setErrorMessage(errorText: "Something went wrong")
                    
                default:
                    setErrorMessage(errorText: "Unknown error")
                }
            }
            
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.isError = false
            self?.errorMessage = ""
            self?.movies = data
        }
        
    }
    
    func setErrorMessage(errorText: String) {
        DispatchQueue.main.async { [weak self] in
            self?.isError = true
            self?.errorMessage = errorText
        }
    }
}
