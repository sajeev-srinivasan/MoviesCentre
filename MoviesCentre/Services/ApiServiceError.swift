//
//  ApiServiceError.swift
//  MoviesCentre
//
//  Created by Sajeev S on 14/09/22.
//

import Foundation

enum ApiServiceError: Error{
    case emptyData, networkError, decodingError, badServerResponse(statusCode: Int), badURL
}
