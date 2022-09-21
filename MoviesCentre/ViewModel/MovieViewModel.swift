//
//  MovieViewModel.swift
//  MoviesCentre
//
//  Created by Sajeev S on 14/09/22.
//

import Foundation

class MovieViewModel: ObservableObject {

    @Published var movies: [Movie] = []
    private var movieApi: ApiServiceProtocol
    
    var navigationTitle: String = "Movie"
    
    init(movieApi: ApiServiceProtocol = MovieApiService()) {
        self.movieApi = movieApi
        loadMovies()
    }
    
    func loadMovies(){
        movieApi.getMovies(completion: completionHandler)
    }
    
    private func completionHandler(data: [Movie]?, error: Error?) -> Void {
        guard error == nil else {
            return
        }
        
        guard let data = data else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.movies = data
        }
    }
}
