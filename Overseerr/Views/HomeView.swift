//
//  HomeView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                CategoryRow(viewModel: DiscoverMoviesViewModel(), categoryName: "Popular Movies")
                    .listRowInsets(EdgeInsets())
                CategoryRow(viewModel: UpcomingMoviesViewModel(), categoryName: "Upcoming Movies")
                    .listRowInsets(EdgeInsets())
                CategoryRow(viewModel: DiscoverSeriesViewModel(), categoryName: "Popular Series")
                    .listRowInsets(EdgeInsets())
                CategoryRow(viewModel: UpcomingSeriesViewModel(), categoryName: "Upcoming Series")
                    .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
            .background(Color.mainBackground)
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
