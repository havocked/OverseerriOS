//
//  MediaCard.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct MediaCard: View {
    
    @State var media: any Media
    var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            WebImage(url: TMDBImage(path: media.posterPath).url)
                .resizable()
                .placeholder(Image(systemName: "photo"))
                .indicator(.activity)
            if isSelected {
                Rectangle().fill(LinearGradient(colors: [.clear, .gray], startPoint: .top, endPoint: .bottom))
            }
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    MediaCapsule(type: media.mediaType)
                    Spacer()
                    if let status = media.mediaInfo?.status {
                        Badge(mediaStatus: status)
                    }
                }
                Spacer()
                if isSelected {
                    Text("2022")
                        .foregroundColor(.white)
                        .font(.caption)
                    Text(media.title)
                        .lineLimit(3)
                        .foregroundColor(.white)
                        .font(.headline)
                    Text(media.overview)
                        .lineLimit(3)
                        .foregroundColor(.white)
                        .font(.caption2)
                    Button(action: {}) {
                        Text("Request")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding(4)
                    }
                    .background(.blue)
                    .cornerRadius(8)
                }
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
        MediaCard(media: MovieResult.default)
    }
}
