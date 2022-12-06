//
//  MovieCard.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCard: View {
    
    @State var movie: MovieResult
    
    var body: some View {
        ZStack {
            WebImage(url: TMDBImage(path: movie.posterPath).url)
                .resizable()
                .placeholder(Image(systemName: "photo"))
                .indicator(.activity)
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    MediaCapsule(type: movie.mediaType)
                    Spacer()
                    if let status = movie.mediaInfo?.status {
                        Badge(mediaStatus: status)
                    }
                }
                Spacer()
            }.padding(8)
        }
        .background(.brown)
        .aspectRatio(2/3, contentMode: .fit)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 1)
        )
    }
}

struct MediaCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: MovieResult.default)
    }
}
