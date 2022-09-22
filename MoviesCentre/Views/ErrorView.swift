//
//  ErrorView.swift
//  MoviesCentre
//
//  Created by Sajeev S on 22/09/22.
//

import SwiftUI

struct ErrorView: View {
    
    var errorImage: String
    var errorText: String
    
    var body: some View {
        ZStack {
            Rectangle()
            VStack{
                Image(systemName: errorImage)
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(.yellow)
                    .padding()
                
                Text(errorText)
                    .padding()
                    .foregroundColor(.white)
                
            }
        }.background(.black)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorImage: "exclamationmark.triangle.fill", errorText: "Unknown Error")
    }
}
