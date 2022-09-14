//
//  ApiParser.swift
//  MoviesCentre
//
//  Created by Sajeev S on 14/09/22.
//

import Foundation

struct ApiResponse: Decodable {
    var data: Cards
}

struct Cards: Decodable {
    var cards: [Card]
}

struct Card: Decodable {
    var content: CardContent
}

struct CardContent: Decodable {
    var title: String
    var description: String
    var rating: Float
    var poster: String
    
    enum CodingKeys: String, CodingKey{
        case title, description, rating, poster = "movie_logo"
    }
}
