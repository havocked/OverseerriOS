//
//  MovieDetailHeaderView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 30/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailHeaderView: View {
    
    let viewModel: HeaderViewModel
    
    var body: some View {
        ZStack {
            BackdropView(backdropURL: viewModel.backdropURL)
            VStack(alignment: .center) {
                WebImage(url: viewModel.posterURL)
                    .resizable()
                    .cornerRadius(16)
                    .aspectRatio(2/3, contentMode: .fit)
                    .frame(width: 200, height: 300)
                    .clipped()
                Text(viewModel.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white).font(.largeTitle)
                Text(viewModel.informations)
                    .foregroundColor(.white)
                    .font(.caption)
                HStack(spacing: 20) {
                    Button {} label: {
                        Label("Watch Trailer", systemImage: "film")
                    }.padding()
                    Button {} label: {
                        Image(systemName: "slider.vertical.3")
                    }
                }
            }.padding([.top], 100)
        }
    }
}

struct MovieDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HeaderViewModel(
            title: "This is a title",
            runtime: 120,
            genres: [.init(id: 1, name: "Horror")],
            backdropPath: "/iHSwvRVsRyxpX7FE7GbviaDvgGZ.jpg",
            posterPath: "/jeGtaMwGxPmQN5xM4ClnwPQcNQz.jpg"
        )
        return MovieDetailHeaderView(viewModel: viewModel)
    }
}
