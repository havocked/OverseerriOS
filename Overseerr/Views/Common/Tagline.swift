//
//  Tagline.swift
//  Overseerr
//
//  Created by Nataniel Martin on 30/11/2022.
//

import SwiftUI

struct Tagline: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .italic()
    }
}

struct Tagline_Previews: PreviewProvider {
    static var previews: some View {
        Tagline(title: "This is a tagline!")
    }
}
