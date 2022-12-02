//
//  CrewView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import SwiftUI

struct CrewView: View {
    
    let crew: Crew
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(crew.job)
                .font(.headline)
            Text(crew.name)
                .font(.subheadline)
        }
        .foregroundColor(.white)
    }
}

struct CrewView_Previews: PreviewProvider {
    static var previews: some View {
        CrewView(crew: Crew.default)
            .background(Color.mainBackground)
    }
}
