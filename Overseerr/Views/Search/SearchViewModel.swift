//
//  SearchViewModel.swift
//  Overseerr
//
//  Created by Nataniel Martin on 01/12/2022.
//

import Foundation

struct SearchQuery: Equatable {
    let term: String
    var page: Int
}

final class SearchViewModel: ObservableObject {
    @Published var searchTerm = ""
    @Published var searchResults: [SearchMedia] = []
    @Published var noResultsFound = false
    @Published var isFetchingInitialResults = false
    @Published var isLoadingMore = false
    @Published var loadingMoreComplete = false
    @Published var showErrorAlert = false
    @Published var mediaType = MediaType.movie {
        didSet {
            search()
        }
    }
    
    private var page: Int = 1
    private let service = APIService()
    private var previousQuery: SearchQuery?
    var errorMessage: String?
    
    init() {
        
    }
    
    func search() {
        guard !searchTerm.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }
        
        let newQuery = SearchQuery(term: searchTerm, page: page)
        if let previousQuery = previousQuery, previousQuery == newQuery {
            //duplicate search
            return
        }
        
        resetSearch()
        previousQuery = newQuery
        sendRequest(newQuery: newQuery)
    }
    
    func loadMore() {
        guard !loadingMoreComplete else {
            stopLoadingMore()
            return
        }
        
        isLoadingMore = true
        if var query = previousQuery {
            query.page += 1
            previousQuery = query
            sendRequest(newQuery: query)
        }
    }
    
    private func resetSearch() {
        searchResults = []
        noResultsFound = false
        errorMessage = nil
        previousQuery = nil
        isLoadingMore = false
        loadingMoreComplete = false
    }
    
    private func sendRequest(newQuery: SearchQuery) {
        if searchResults.count == 0 {
            isFetchingInitialResults = true
        }
        
        service.searchMedia(for: newQuery.term, page: newQuery.page) { [weak self] result in
            self?.isFetchingInitialResults = false
            
            if case .failure(let error) = result {
                self?.handleSearchError(error)
            }
            
            if case .success(let data) = result {
                self?.handleSearchResults(data)
            }
        }
    }
    
    private func handleSearchResults(_ data: PaginatedResponse<SearchMedia>) {
        guard data.results.count > 0 else {
            if isLoadingMore {
                stopLoadingMore()
            } else {
                noResultsFound = true
            }
            return
        }
        
        searchResults += data.results
    }
    
    private func handleSearchError(_ error: Error) {
        print("error Searching media list: \(error)")
        errorMessage = error.localizedDescription
        showErrorAlert = true
        isLoadingMore = false
        // allow user to retry the same search due to the error
        previousQuery = nil
    }
    
    private func stopLoadingMore() {
        isLoadingMore = false
        loadingMoreComplete = true
    }
}
