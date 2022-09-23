//
//  Movie.swift
//  MoviesCentre
//
//  Created by Sajeev S on 14/09/22.
//

import Foundation

struct Movie:Equatable, Hashable{
    var title: String
    var description: String
    var rating: Float
    var ratingFormatted: String {
        return "Rating: \(rating)"
    }
    var poster: String
}
