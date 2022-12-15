//
//  PersonDetailsViewModel.swift
//  Overseerr
//
//  Created by Nataniel Martin on 08/12/2022.
//

import Foundation

class PersonDetailsViewModel: ObservableObject {
    @Published var person: PersonDetails
    @Published var state: FetchState = .good
    
    let service = APIService()
    
    init(personResult: PersonResult) {
        self.person = PersonDetails(result: personResult)
    }
    
    func fetchPersonDetails() {
        guard state == .good else {
            return
        }
        
        state = .isLoading
        
        service.fetchPersonDetails(for: person.id) { [weak self] result in
            switch result {
            case .success(let data):
                self?.person = data
                self?.state = .loadedAll
            case .failure(let error):
                self?.state = .error("Could not load: \(error.localizedDescription)")
            }
        }
    }
}
