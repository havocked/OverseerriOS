//
//  SearchView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 01/12/2022.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var searchViewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                SearchBar(text: $searchViewModel.searchTerm) {
                    searchViewModel.search()
                }
                ZStack {
                    SearchListView(searchViewModel: searchViewModel)
                    
                    if searchViewModel.isFetchingInitialResults {
                        ProgressView()
                    }
                    
                    if searchViewModel.noResultsFound {
                        Text("No results found.")
                            .bold()
                    }
                }
            }.alert(isPresented: $searchViewModel.showErrorAlert) {
                let message = searchViewModel.errorMessage
                searchViewModel.errorMessage = nil
                
                return Alert(
                    title: Text("Error"),
                    message: Text(message ?? APIError.unknown.localizedDescription)
                )
            }
            .navigationBarHidden(true)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
