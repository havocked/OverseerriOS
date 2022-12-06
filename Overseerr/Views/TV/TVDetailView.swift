//
//  TVDetailView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import SwiftUI

struct TVDetailView: View {
    @ObservedObject var viewModel: TVDetailViewModel
    
    var body: some View {
        ScrollView {
            MovieDetailHeaderView(viewModel: HeaderViewModel(title: viewModel.tv.name, runtime: 0, genres: viewModel.tv.genres, backdropPath: viewModel.tv.backdropPath, posterPath: viewModel.tv.posterPath))
            VStack(alignment: .leading, spacing: 12) {
                Group {
                    Tagline(title: viewModel.tv.tagline)
                    Text("Overview")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                    Text(viewModel.tv.overview)
                        .foregroundColor(.white)
                }.padding([.leading, .trailing], 20)
                CrewOverView(crewList: viewModel.tv.credits.crew)
                CastRow(title: "Cast", castList: viewModel.tv.credits.cast)
                CategoryRow(viewModel: RecommendationSeriesViewModel(seriesId: viewModel.tv.id, loadAllPages: false), categoryName: "Recommendations")
                CategoryRow(viewModel: SimilarSeriesViewModel(seriesId: viewModel.tv.id, loadAllPages: false), categoryName: "Similar Movies")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.mainBackground)
        .onAppear {
            self.viewModel.fetchTVDetails()
        }
    }
}

struct TVDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TVDetailView(viewModel: TVDetailViewModel(tvResult: .default))
    }
}
