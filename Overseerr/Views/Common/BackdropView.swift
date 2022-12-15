//
//  BackdropView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

/// Contains the gap between the smallest value for the y-coordinate of
/// the frame layer and the content layer.
private struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

struct ScrollViewOffset<Content: View>: View {
    let content: () -> Content
    let onOffsetChange: (CGFloat) -> Void
    
    init(
        @ViewBuilder content: @escaping () -> Content,
        onOffsetChange: @escaping (CGFloat) -> Void
    ) {
        self.content = content
        self.onOffsetChange = onOffsetChange
    }
    
    var body: some View {
        ScrollView {
            offsetReader
            content()
                .padding(.top, -8) // 👈🏻 places the real content as if our `offsetReader` was not there.
        }
        
        .coordinateSpace(name: "frameLayer")
        .onPreferenceChange(OffsetPreferenceKey.self, perform: onOffsetChange)
    }
    
    var offsetReader: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(
                    key: OffsetPreferenceKey.self,
                    value: proxy.frame(in: .named("frameLayer")).minY
                )
        }
        .frame(height: 0) // 👈🏻 make sure that the reader doesn't affect the content height
    }
}

struct BackdropView: View {
    let backdropURL: URL?
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                WebImage(url: backdropURL)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: geometry.size.width,
                        height: check(geometry) ? geometry.size.height : geometry.size.height + geometry.frame(in: .global).minY,
                        alignment: .center
                    )
                    .offset(
                        y: check(geometry) ? 0 : -geometry.frame(in: .global).minY
                    )
                    .blur(radius: check(geometry) ? -0.1 * geometry.frame(in: .global).minY : 0)
                    .navigationTitle("")
                Rectangle()
                    .fill(LinearGradient(colors: [.clear, .mainBackground], startPoint: .top, endPoint: .bottom))
                VStack {
                    Spacer()
                    Rectangle() // Prevent blur bleeding outside the view (acts like a clip and prevent using coditionnals in the view
                        .fill(Color.mainBackground)
                        .frame(height: check(geometry) ? -0.3 * geometry.frame(in: .global).minY : 0)
                        .offset(
                            y: check(geometry) ? -0.3 * geometry.frame(in: .global).minY : 0
                        )
                }
            }
        }
        //.edgesIgnoringSafeArea([.top, .bottom])
    }
    
    func check(_ proxy: GeometryProxy) -> Bool {
        return proxy.frame(in: .named("scroll")).minY < 0
    }
}

struct BackdropView_Previews: PreviewProvider {
    static var previews: some View {
        let tmdbImage = TMDBImage(size: .init(width: 400, height: 300), path: MovieResult.default.backdropPath)
        BackdropView(backdropURL: tmdbImage.url)
    }
}
