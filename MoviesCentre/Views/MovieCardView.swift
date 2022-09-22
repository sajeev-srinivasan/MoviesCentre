//
//  MovieCardView.swift
//  MoviesCentre
//
//  Created by Sajeev S on 14/09/22.
//

import SwiftUI

struct MovieCardView: View {
    
    let movieURL: String
    
    let cardViewModel: MovieCardViewModel = MovieCardViewModel()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            
            AsyncImage(url: URL(string: movieURL)) { phase in
                if let image = phase.image {
                    image.resizable().cornerRadius(20)
                }
                
                else if phase.error != nil {
                    Image(systemName: cardViewModel.noDataImage)
                        .resizable()
                        .foregroundColor(Color.red)
                        .frame(width: 25, height: 25, alignment: .center)
                    
                    Text(cardViewModel.noDataText)
                        .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
                else{
                    ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                }
            }
        }
        .background(.black)
        .aspectRatio(2/3, contentMode: .fit)
    }
}


struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movieURL: "https://m.media-amazon.com/images/M/MV5BMTg0NTM3MTI1MF5BMl5BanBnXkFtZTgwMTAzNTAzNzE@._V1_.jpg")
    }
}
