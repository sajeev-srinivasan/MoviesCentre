//
//  ApiServiceProtocol.swift
//  MoviesCentre
//
//  Created by Sajeev S on 14/09/22.
//

import Foundation

protocol ApiServiceProtocol {
    func getMovies(completion: @escaping ([Movie]?, Error?) -> Void)
}
