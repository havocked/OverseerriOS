//
//  BackdropView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct BackdropView: View {
    
    var isFaded: Bool = false
    let backdropURL: URL?
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                if geometry.frame(in: .global).minY < 0 {
                    WebImage(url: backdropURL)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                        .offset(y: geometry.frame(in: .global).minY/9)
                        .blur(radius: -geometry.frame(in: .global).minY)
                        .clipped()
                        .navigationTitle("")
                } else {
                    WebImage(url: backdropURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                        .offset(y: -geometry.frame(in: .global).minY)
                    //.blur(radius: geometry.frame(in: .global).minY)
                        .navigationTitle("")
                }
                if isFaded {
                    Rectangle().fill(LinearGradient(colors: [.clear, .mainBackground], startPoint: .top, endPoint: .bottom))
                } else {
                    EmptyView()
                }
            }
        }
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct BackdropView_Previews: PreviewProvider {
    static var previews: some View {
        let tmdbImage = TMDBImage(size: .init(width: 400, height: 300), path: Movie.default.backdropPath)
        BackdropView(isFaded: true, backdropURL: tmdbImage.url)
    }
}
