//
//  ContentView.swift
//  MoviesCentre
//
//  Created by Sajeev S on 14/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel: MovieViewModel = MovieViewModel()
    
    var body: some View {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(viewModel.movies, id: \.self) { movie in
                        MovieCardView(movieURL: movie.poster)
                    }
                }
            }.background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
