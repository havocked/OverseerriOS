//
//  AppearancesViewModel.swift
//  Overseerr
//
//  Created by Nataniel Martin on 08/12/2022.
//

import Foundation

class AppearencesViewModel: ObservableObject {
    @Published var results: CombinedCredits? = nil
    @Published var state: FetchState = .good
    
    let personId: Int
    
    let service = APIService()
    
    init(personId: Int) {
        self.personId = personId
    }
 
    func fetchCombinedCredits() {
        guard state == .good else {
            return
        }
        
        state = .isLoading
        
        service.fetchCombinedCredits(for: personId) { [weak self] result in
                switch result {
                case .success(let data):
                    self?.results = data
                    self?.state = .loadedAll
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
       }
}
