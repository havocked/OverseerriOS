//
//  PersonDetailsView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import SwiftUI

struct PersonDetailsView: View {
    let person: PersonResult
    
    var body: some View {
        ZStack {
            BackdropView(isFaded: true, backdropURL: TMDBImage(path: person.backdropPath).url)
            VStack(alignment: .center) {
                RoundImageView(url: TMDBImage(path: person.profilePath).url)
                Text(person.name)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white).font(.largeTitle)
                Text("Born | location")
                    .foregroundColor(.white)
                    .font(.caption)
                Text("Also known as: sdkfdsf jksdfk jsdjk f")
                    .foregroundColor(.white)
                    .font(.caption)
                Text("Christian Charles Philip Bale (born 30 January 1974) is an English actor. Known for his versatility and recurring physical transformations to play his roles, he has been a leading man in films of several genres. Bale is the recipient of various accolades, including an Academy Award and two Golden Globe Awards. Time magazine included him on its list of the 100 most influential people in the world in 2011.\n\nBorn in Wales to English parents, Bale had his breakthrough role at age 13 in Steven Spielberg's 1987 war film Empire of the Sun. After more than a decade of performing in leading and supporting roles in films, he gained wider recognition for his portrayals of serial killer Patrick Bateman in the black comedy American Psycho (2000) and the titular role in the psychological thriller The Machinist (2004). In 2005, Bale played superhero Batman in Batman Begins and reprised the role in the sequels The Dark Knight (2008) and The Dark Knight Rises (2012)")
                    .foregroundColor(.white)
                    .font(.caption)
            }.padding([.top], 100)
        }
    }
}

struct PersonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailsView(person: .default)
    }
}
