//
//  DiscoverMoviesViewModel.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import Foundation

class DiscoverMoviesViewModel: MediaViewModel {
    @Published var results: [SearchMedia] = []
    @Published var state: FetchState = .good
    
    var page: Int = 1
    
    let service = APIService()
    
    init() {
        clear()
        fetchMedias()
    }
    
    func clear() {
        state = .good
        results = []
        page = 1
    }
    
    func loadMore() {
        fetchMedias()
    }
    
    func fetchMedias() {
        guard state == .good else {
            return
        }
        
        state = .isLoading
        
        service.fetchDiscoverMovies(page: page) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.results.append(contentsOf: data.results.map({ .movie($0) }))
                    self?.page += 1
                    self?.state = (data.totalResults == self?.results.count) ? .good : .loadedAll
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
        }
    }
}
