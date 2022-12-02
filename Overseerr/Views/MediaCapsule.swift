//
//  MediaCapsule.swift
//  Overseerr
//
//  Created by Nataniel Martin on 28/11/2022.
//

import SwiftUI

struct MediaCapsule: View {
    
    var type: MediaType
    
    var body: some View {
        Text(type.title)
            .foregroundColor(.white)
            .font(.caption).bold()
            .padding([.leading, .trailing], 8)
            .padding([.top, .bottom], 3)
            .background(Capsule().fill(type.color))
    }
}

struct MediaCapsule_Previews: PreviewProvider {
    static var previews: some View {
        MediaCapsule(type: .movie)
    }
}
