//
//  MovieDetailViewModel.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var movie: MovieDetails
    @Published var state: FetchState = .good
    
    let service = APIService()
    
    init(movieResult: MovieResult) {
        self.movie = MovieDetails(movieResult: movieResult)
    }
 
    func fetchMovieDetails() {
        guard state == .good else {
            return
        }
        
        state = .isLoading
        
        service.fetchMovieDetails(for: movie.id) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.movie = data
                    self?.state = .loadedAll
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
        }
    }
}
