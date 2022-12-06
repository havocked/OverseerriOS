//
//  CategoryRow.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import SwiftUI

struct CategoryRow<Model>: View where Model: MediaViewModel {
    @ObservedObject var viewModel: Model
    var categoryName: String
    
    var body: some View {
        if !viewModel.results.isEmpty {
            VStack(alignment: .leading) {
                Text(categoryName)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 14) {
                        ForEach(viewModel.results, id: \.id) { media in
                            switch media {
                            case .movie(let movieResult):
                                NavigationLink {
                                    MovieDetailView(viewModel: .init(movieResult: movieResult))
                                } label: {
                                    MovieCard(movie: movieResult)
                                }
                            case .tv(let tvResult):
                                NavigationLink {
                                    TVDetailView(viewModel: .init(tvResult: tvResult))
                                } label: {
                                    TVCard(tv: tvResult)
                                }
                            case .person(let personResult):
                                EmptyView()
                            }
                        }
                    }
                    .padding(35)
                }
                .frame(height: 300)
                .padding(-35)
                
                switch viewModel.state {
                case .good:
                    Color.clear
                        .onAppear {
                            viewModel.fetchMedias()
                        }
                case .isLoading:
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(maxWidth: .infinity)
                case .loadedAll:
                    EmptyView()
                case .error(let message):
                    Text(message)
                        .foregroundColor(.white)
                }
            }
            .padding(20)
            .background(Color.mainBackground)
        } else {
            EmptyView()
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CategoryRow(
                viewModel: UpcomingMoviesViewModel(),
                categoryName: "Trending"
            )
        }
    }
}
