//
//  RoundImageView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct RoundImageView: View {
    
    let url: URL?
    
    var body: some View {
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
    }
}

struct RoundImageView_Previews: PreviewProvider {
    static var previews: some View {
        RoundImageView(url: TMDBImage(path: "/d0ZWYNTGscHKFbjkA5Lrg4AOjnX.jpg").url)
    }
}
