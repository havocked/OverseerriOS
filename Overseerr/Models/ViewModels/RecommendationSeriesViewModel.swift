//
//  RecommendationSeriesViewModel.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import Foundation

class RecommendationSeriesViewModel: MediaViewModel {
    @Published var results: [SearchMedia] = []
    @Published var state: FetchState = .good
    
    var page: Int = 1
    let loadAllPages: Bool
    var seriesId: Int
    
    let service = APIService()
    
    init(seriesId: Int, loadAllPages: Bool = true) {
        self.seriesId = seriesId
        self.loadAllPages = loadAllPages
        self.clear()
        self.fetchMedias()
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
        
        service.fetchSeriesRecommendations(for: seriesId, page: page) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.results.append(contentsOf: data.results.map({ .tv($0) }))
                    self?.page += 1
                    
                    if self?.loadAllPages == true {
                        self?.state = (data.totalResults == self?.results.count) ? .good : .loadedAll
                    } else {
                        self?.state = .loadedAll
                    }
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
        }
    }
}
