//
//  PersonDetailsView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import SwiftUI

struct PersonHeaderDetailsView: View {
    let person: PersonDetails
    
    var body: some View {
        ZStack {
            BackdropView(backdropURL: nil)
            VStack(alignment: .center) {
                RoundImageView(url: TMDBImage(path: person.profilePath).url)
                    .frame(width: 200)
                Text(person.name)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white).font(.largeTitle)
                if let placeOfBirth = person.placeOfBirth {
                    Text(placeOfBirth)
                        .foregroundColor(.white)
                        .font(.caption)
                }
                if person.alsoKnownAs.count > 0 {
                    Text("Also known as: \(person.alsoKnownAs.joined(separator: " | "))")
                        .foregroundColor(.white)
                        .font(.caption)
                }
                if let biography = person.biography {
                    Text(biography)
                        .foregroundColor(.white)
                        .font(.caption)
                }
            }.padding([.top], 100)
        }
    }
}

struct PersonHeaderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonHeaderDetailsView(person: .init(result: .default))
    }
}
