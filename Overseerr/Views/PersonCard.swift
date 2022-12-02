//
//  PersonCard.swift
//  Overseerr
//
//  Created by Nataniel Martin on 30/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct PersonCard: View {
    
    let url: URL?
    let title: String
    var subtitle: String? = nil
    
    init(with cast: Cast) {
        self.url = TMDBImage(path: cast.profilePath).url
        self.title = cast.name
        self.subtitle = cast.character
    }
    
    init(with person: PersonResult) {
        self.url = TMDBImage(path: person.profilePath).url
        self.title = person.name
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.grayBackground, strokeBorder: .gray, lineWidth: 1)
            
            VStack {
                Spacer()
                Circle()
                    .fill(.clear)
                    .aspectRatio(0.6, contentMode: .fit)
                    .background {
                        WebImage(url: url)
                            .resizable()
                            .placeholder(.init(systemName: "person.fill"))
                            .scaledToFill()
                            .clipShape(Circle())
                    }
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                    .font(.caption)
                    .padding([.leading, .trailing], 4)
                if let subtitle = self.subtitle {
                    Text(subtitle)
                        .foregroundColor(.white)
                        .font(.caption2)
                        .padding([.leading, .trailing], 4)
                }
                Spacer()
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}

extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

extension InsettableShape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

struct PersonCard_Previews: PreviewProvider {
    static var previews: some View {
        let cast = Cast.default
        //PersonCard(with: cast)
        PersonCard(with: PersonResult.init(id: 123, name: "Actor name", profilePath: nil, adult: false))
            .frame(width: 300)
    }
}
