//
//  TVDetailViewModel.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import Foundation

class TVDetailViewModel: ObservableObject {
    @Published var tv: TVDetails
    @Published var state: FetchState = .good
    
    let service = APIService()
    
    init(tvResult: TVResult) {
        self.tv = TVDetails(tvResult: tvResult)
    }
 
    func fetchTVDetails() {
        guard state == .good else {
            return
        }
        
        state = .isLoading
        
        service.fetchTVDetails(for: tv.id) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.tv = data
                    self?.state = .loadedAll
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
        }
    }
}
