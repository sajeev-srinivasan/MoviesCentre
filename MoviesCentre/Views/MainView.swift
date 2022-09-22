//
//  ContentView.swift
//  MoviesCentre
//
//  Created by Sajeev S on 14/09/22.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject private var viewModel: MovieViewModel = MovieViewModel()
    
    var body: some View {
        
        if viewModel.isError {
            ErrorView(errorImage: viewModel.errorImage, errorText: viewModel.errorMessage)
        }
        
        else {
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
                    .navigationTitle(viewModel.navigationTitle)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            VStack{
                                Text(viewModel.navigationTitle)
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                
            }.accentColor(.white)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
