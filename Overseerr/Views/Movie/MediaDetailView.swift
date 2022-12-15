//
//  MediaDetailView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 28/11/2022.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        ScrollViewOffset {
            MovieDetailHeaderView(viewModel: HeaderViewModel(viewModel: viewModel))
            VStack(alignment: .leading, spacing: 12) {
                Group {
                    Tagline(title: viewModel.movie.tagline, isRedacted: viewModel.state == .isLoading)
                    Text("Overview")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                    Text(viewModel.movie.overview)
                        .foregroundColor(.white)
                }.padding([.leading, .trailing])
                CrewOverView(crewList: viewModel.movie.credits.crew)
                CategoryRow(viewModel: CastListViewModel(castList: viewModel.movie.credits.cast), categoryName: "Cast")
                CategoryRow(viewModel: RecommendationMoviesViewModel(movieId: viewModel.movie.id, loadAllPages: false), categoryName: "Recommendations")
                CategoryRow(viewModel: SimilarMoviesViewModel(movieId: viewModel.movie.id, loadAllPages: false), categoryName: "Similar Movies")
            }
        } onOffsetChange: { offset in
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.mainBackground)
        .onAppear {
            self.viewModel.fetchMovieDetails()
        }
    }
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(movieResult: .default))
    }
}
