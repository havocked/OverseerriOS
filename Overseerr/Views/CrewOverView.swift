//
//  CrewOverView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import SwiftUI

struct CrewOverView: View {
    
    let crewList: [Crew]
    
    var shortedList: [Crew] {
        return crewList.sortCrewPriority().prefix(6).map({ $0 })
    }
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
            ForEach(shortedList, id: \.creditId) { crew in
                CrewView(crew: crew)
            }
        }
        .padding()
    }
}

struct CrewOverView_Previews: PreviewProvider {
    static var previews: some View {
        CrewOverView(
            crewList:[
                .default,
                .default(customName:"Nate Doe", customId: "111"),
                .default(customName:"Jane Doe", customId: "222"),
                .default(customName:"Yolo Doe", customId: "444"),
                .default(customName:"Tom Doe", customId: "4443355"),
                .default(customName:"Jill Doe", customId: "4494455"),
                .default(customName:"Jsmed Doe", customId: "44223455"),
                .default(customName:"Test Doe", customId: "2344477")
            ]
        )
        .background(Color.mainBackground)
    }
}
