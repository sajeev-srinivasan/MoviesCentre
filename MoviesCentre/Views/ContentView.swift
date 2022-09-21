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
        NavigationView {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(viewModel.movies, id: \.self) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieCardView(movieURL: movie.poster).cornerRadius(20)
                        }.foregroundColor(.black)
                    }
                }
            }.background(.black)
                .navigationTitle("Movies")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack{
                            Text("Movies")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                }
            
        }.accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
