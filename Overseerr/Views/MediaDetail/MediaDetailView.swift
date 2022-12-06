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
        ScrollView {
            MovieDetailHeaderView(viewModel: HeaderViewModel(title: viewModel.movie.title, runtime: viewModel.movie.runtime, genres: viewModel.movie.genres, backdropPath: viewModel.movie.backdropPath, posterPath: viewModel.movie.posterPath))
            VStack(alignment: .leading, spacing: 12) {
                Group {
                    Tagline(title: viewModel.movie.tagline)
                    Text("Overview")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                    Text(viewModel.movie.overview)
                        .foregroundColor(.white)
                }.padding([.leading, .trailing], 20)
                CrewOverView(crewList: viewModel.movie.credits.crew)
                TrailingButton(title: "View Full Crew", systemImage: "arrow.forward.circle")
                    .padding([.leading, .trailing], 20)
                CastRow(title: "Cast", castList: viewModel.movie.credits.cast)
                CategoryRow(viewModel: RecommendationMoviesViewModel(movieId: viewModel.movie.id, loadAllPages: false), categoryName: "Recommendations")
                CategoryRow(viewModel: SimilarMoviesViewModel(movieId: viewModel.movie.id, loadAllPages: false), categoryName: "Similar Movies")
            }
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
