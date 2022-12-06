//
//  TVCard.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct TVCard: View {
    @State var tv: TVResult
    
    var body: some View {
        ZStack {
            WebImage(url: TMDBImage(path: tv.posterPath).url)
                .resizable()
                .placeholder(Image(systemName: "photo"))
                .indicator(.activity)
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    MediaCapsule(type: tv.mediaType)
                    Spacer()
                    if let status = tv.mediaInfo?.status {
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

struct TVCard_Previews: PreviewProvider {
    static var previews: some View {
        TVCard(tv: .default)
    }
}
