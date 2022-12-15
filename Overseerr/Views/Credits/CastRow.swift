//
//  CastRow.swift
//  Overseerr
//
//  Created by Nataniel Martin on 30/11/2022.
//

import SwiftUI


class CastListViewModel: MediaViewModel {
    @Published var results: [SearchMedia] = []
    @Published var state: FetchState = .good
    
    var page: Int = 1
    let loadAllPages: Bool
    
    let service = APIService()
    
    init(castList: [Cast], loadAllPages: Bool = true) {
        self.loadAllPages = loadAllPages
        self.clear()
        self.fetchMedias()
        
        results.append(contentsOf: castList.map({ .person(.init(id: $0.id, name: $0.name, profilePath: $0.profilePath, adult: false, knownFor: [])) }))
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
    }
    
}
