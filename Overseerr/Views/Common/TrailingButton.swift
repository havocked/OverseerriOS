//
//  TrailingButton.swift
//  Overseerr
//
//  Created by Nataniel Martin on 30/11/2022.
//

import SwiftUI

struct TrailingButton: View {
    
    let title: String
    let systemImage: String
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                
            } label: {
                Label(title, systemImage: systemImage)
            }
        }
    }
}

struct TrailingButton_Previews: PreviewProvider {
    static var previews: some View {
        TrailingButton(
            title: "View Full Crew",
            systemImage: "arrow.forward.circle"
        )
    }
}
