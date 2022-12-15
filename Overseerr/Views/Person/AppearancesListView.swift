//
//  AppearancesListView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import SwiftUI

struct AppearancesListView: View {
    
    @ObservedObject var viewModel: AppearencesViewModel
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                if let castList = viewModel.results?.cast {
                    Section(header: header(title: "Apparence")) {
                        ForEach(castList) { cast in
                            switch cast.mediaType {
                            case .movie:
                                MovieCard(movie: .default)
                            case .tv:
                                TVCard(tv: .default)
                            case .person:
                                EmptyView()
                            }
                        }
                    }
                }
            }
        }.onAppear {
            self.viewModel.fetchCombinedCredits()
        }
    }
    
    @ViewBuilder
    func header(title: String) -> some View {
        HStack {
            Text(title)
            Spacer()
        }
    }
}

struct AppearancesListView_Previews: PreviewProvider {
    static var previews: some View {
        AppearancesListView(viewModel: .init(personId: 974169))
    }
}
