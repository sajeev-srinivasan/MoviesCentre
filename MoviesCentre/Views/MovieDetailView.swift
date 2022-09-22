//
//  MovieDetailView.swift
//  MoviesCentre
//
//  Created by Sajeev S on 15/09/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    var movie: Movie
    
    var body: some View {
        ScrollView {
            VStack{
                MovieCardView(movieURL: movie.poster)
                
                Text(movie.title)
                    .foregroundColor(.white)
                    .font(.largeTitle).fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top, .leading], 10)
                    .padding(.bottom, 5)
                
                Text(movie.description)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 10)

                    
                Text(movie.rating.formatted())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 13)
                    .padding(.top, 3)
                    
            }
        }.background(.black)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(title: "Hello, Dolly!",
                                     description: "Matchmaker Dolly Levi travels to Yonkers to find a partner for half-a-millionaire Horace Vandergelder, convincing his niece, his niece's intended, and his two clerks to travel to New York City along the way.",
                                     rating: 7.1,
                                     poster: "https://m.media-amazon.com/images/M/MV5BODJmZmFiNzQtMDJiYS00ZTgzLTljZGMtNjEzNzM4NmEyYjNiXkEyXkFqcGdeQXVyNjE5MjUyOTM@._V1_.jpg"))
    }
}
