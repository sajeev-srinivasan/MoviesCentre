//
//  MovieApiService.swift
//  MoviesCentre
//
//  Created by Sajeev S on 14/09/22.
//

import Foundation

class MovieApiService: ApiServiceProtocol{
    private var session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession(configuration: .default)){
        self.session = session
    }
    
    func getMovies(completion: @escaping ([Movie]?, Error?) -> Void){
        let request = URLRequest(url: URL(string: Api.URL + Api.moviesEndPoint)!)
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard error == nil else {
                completion(nil, ApiServiceError.networkError)
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                if (!(200...299).contains(httpResponse.statusCode)) {
                    completion(nil, ApiServiceError.badServerResponse(statusCode: httpResponse.statusCode))
                    return
                }
            }
            
            guard let data = data else {
                completion(nil, ApiServiceError.emptyData)
                return
            }
            
            do{
                try completion(self.convertToMovies(data: data), nil)
            }
            catch{
                completion(nil, ApiServiceError.decodingError)
            }
            
        }
        task.resume()
    }
    
    func convertToMovies(data: Data) throws -> [Movie]{
        let result = try JSONDecoder().decode(ApiResponse.self, from: data)
        let movies = result.data.cards
        
        return movies.map{
            Movie(title: $0.content.title,
                  description: $0.content.description,
                  rating: $0.content.rating,
                  poster: $0.content.poster)
        }
    }
    
}
