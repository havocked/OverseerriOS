//
//  CastRow.swift
//  Overseerr
//
//  Created by Nataniel Martin on 30/11/2022.
//

import SwiftUI

struct CastRow: View {
    var title: String
    var castList: [Cast]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .bold()
                .foregroundColor(.white)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(castList, id: \.creditId) { cast in
                        PersonCard(with: cast)
                    }
                }
                .padding(35)
            }
            .frame(height: 300)
            .padding(-35)
        }
        .padding(20)
        .background(Color.mainBackground)
    }
}

struct CastRow_Previews: PreviewProvider {
    static var previews: some View {
        CastRow(
            title: "Cast",
            castList: [
                .default,
                .default(customCreditId: "123"),
                .default(customCreditId: "345"),
                .default(customCreditId: "6453")
            ]
        )
    }
}
