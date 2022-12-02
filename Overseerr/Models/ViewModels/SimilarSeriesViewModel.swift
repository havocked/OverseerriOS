//
//  SimilarSeriesViewModel.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import Foundation

class SimilarSeriesViewModel: MediaViewModel {
    @Published var results: [any Media] = []
    @Published var state: FetchState = .good
    
    var page: Int = 1
    var seriesId: Int
    
    let service = APIService()
    
    init(seriesId: Int) {
        self.seriesId = seriesId
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
        
        service.fetchSimilarSeries(for: seriesId, page: page) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.results.append(contentsOf: data.results)
                    self?.page += 1
                    self?.state = (data.totalResults == self?.results.count) ? .good : .loadedAll
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
        }
    }
}
