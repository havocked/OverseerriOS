//
//  SearchListView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 01/12/2022.
//

import SwiftUI

struct SearchListView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        Group {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    Section(footer: footer()) {
                        ForEach(searchViewModel.searchResults, id: \.id) { item in
                            VStack {
                                switch item {
                                case .movie(let movieResult):
                                    NavigationLink {
                                        MovieDetailView(viewModel: MovieDetailViewModel(movieResult: movieResult))
                                    } label: {
                                        MovieCard(movie: movieResult)
                                    }
                                case .tv(let tvResult):
                                    NavigationLink {
                                        TVDetailView(viewModel: TVDetailViewModel(tvResult: tvResult))
                                    } label: {
                                        TVCard(tv: tvResult)
                                    }
                                case .person(let personResult):
                                    PersonCard(with: personResult)
                                }
                                Divider()
                                    .onAppear {
                                        if item.id == searchViewModel.searchResults.last?.id {
                                            searchViewModel.loadMore()
                                        }
                                    }
                            }
                        }
                    }
                }
                .padding(16)
            }.gesture(
                DragGesture()
                    .onChanged { _ in
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                    }
            )
        }
    }
    
    @ViewBuilder
    func footer() -> some View {
        if searchViewModel.isLoadingMore {
            HStack {
                Spacer()
                ProgressView("Loading...")
                    .padding([.top, .bottom], 10)
                Spacer()
            }
        }  else {
            EmptyView()
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    
    static let searchViewModel: SearchViewModel = {
        let viewModel = SearchViewModel()
        viewModel.searchResults = [.movie(.default), .tv(.default), .person(.init(id: 123333, name: "This is a profile", profilePath: nil, adult: false))]
        return viewModel
    }()
    
    static var previews: some View {
        SearchListView(searchViewModel: searchViewModel)
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
    }
}
