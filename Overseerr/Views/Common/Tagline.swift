//
//  Tagline.swift
//  Overseerr
//
//  Created by Nataniel Martin on 30/11/2022.
//

import SwiftUI

struct Tagline: View {
    
    let title: String
    let isRedacted: Bool
    
    var body: some View {
        Text(isRedacted ? "This a placeholder while loading" : title)
            .foregroundColor(.white)
            .italic()
            .redacted(reason: isRedacted ? .placeholder : .init())
    }
}

struct Tagline_Previews: PreviewProvider {
    static var previews: some View {
        Tagline(title: "This is a tagline!", isRedacted: true)
            .background(Color.mainBackground)
    }
}
