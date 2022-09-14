//
//  TestConstants.swift
//  MoviesCentreTests
//
//  Created by Sajeev S on 14/09/22.
//

import Foundation

@testable import MoviesCentre

struct TestConstants {
    static let movieData = """
    {
      "data": {
        "cards": [
          {
            "card_id": "movie_01",
            "start_time": 1544510274,
            "end_time": 1576780200,
            "priority": 0.99,
            "hide_on_use": true,
            "hide_on_use_for_seconds": 300,
            "card_template": "movie_card",
            "poi_lat_long": "-6.2145983,106.8451283",
            "distance_threshold_in_meters": 2000,
            "content": {
              "title": "El Camino' Cooks Up 'Breaking Bad' Easter Eggs",
              "description": "On this spoiler-filled IMDbrief, we break bad and break down the Breaking Bad finale part two: 'El Camino' (2019).",
              "movie_logo": "https://m.media-amazon.com/images/M/MV5BMjFjOGEwYjAtNDQxYy00OThhLWI3NDYtYTEyOGRlZDRhN2ViXkEyXkFqcGdeQXRyYW5zY29kZS13b3JrZmxvdw@@._V1_.jpg",
              "rating": 8.0,
              "actions": [
                {
                  "description": "Submit",
                  "deeplink":"iosapp://test"
                }
              ]
            }
          },
          {
            "card_id": "movie_02",
            "start_time": 1544510274,
            "end_time": 1576780200,
            "priority": 0.20,
            "hide_on_use": true,
            "hide_on_use_for_seconds": 300,
            "card_template": "movie_card",
            "poi_lat_long": "-6.2145983,106.8451283",
            "distance_threshold_in_meters": 2000,
            "content": {
              "title": "Hello, Dolly!",
              "description": "Matchmaker Dolly Levi travels to Yonkers to find a partner for half-a-millionaire Horace Vandergelder, convincing his niece, his niece's intended, and his two clerks to travel to New York City along the way.",
              "movie_logo": "https://m.media-amazon.com/images/M/MV5BODJmZmFiNzQtMDJiYS00ZTgzLTljZGMtNjEzNzM4NmEyYjNiXkEyXkFqcGdeQXVyNjE5MjUyOTM@._V1_.jpg",
              "rating": 7.1,
              "actions": [
                {
                  "description": "Submit",
                  "deeplink":"iosapp://test"
                }
              ]
            }
          }
         ]
        }
     }
""".data(using: .utf8)
    
    static let movies = [
        Movie(title: "El Camino' Cooks Up 'Breaking Bad' Easter Eggs",
              description: "On this spoiler-filled IMDbrief, we break bad and break down the Breaking Bad finale part two: 'El Camino' (2019).",
              rating: 8.0,
              poster: "https://m.media-amazon.com/images/M/MV5BMjFjOGEwYjAtNDQxYy00OThhLWI3NDYtYTEyOGRlZDRhN2ViXkEyXkFqcGdeQXRyYW5zY29kZS13b3JrZmxvdw@@._V1_.jpg"),
        
        Movie(title: "Hello, Dolly!",
              description: "Matchmaker Dolly Levi travels to Yonkers to find a partner for half-a-millionaire Horace Vandergelder, convincing his niece, his niece's intended, and his two clerks to travel to New York City along the way.",
              rating: 7.1,
              poster: "https://m.media-amazon.com/images/M/MV5BODJmZmFiNzQtMDJiYS00ZTgzLTljZGMtNjEzNzM4NmEyYjNiXkEyXkFqcGdeQXVyNjE5MjUyOTM@._V1_.jpg")
    ]
}


