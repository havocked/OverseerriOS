//
//  RoundImageView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct RoundImageView: View {
    let url: URL?
    
    var body: some View {
        Circle()
            .fill(.red)
            .aspectRatio(contentMode: .fit)
            .overlay {
                WebImage(url: url)
                    .resizable()
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
