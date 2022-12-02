//
//  MovieDetailViewModel.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var movieDetail: MovieDetail
    @Published var state: FetchState = .good
    
    let service = APIService()
    
    init(media: any Media) {
        self.movieDetail = MovieDetail(media: media)
    }
 
    func fetchMovieDetails() {
        guard state == .good else {
            return
        }
        
        state = .isLoading
        
        service.fetchMoviesDetails(for: movieDetail.id) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.movieDetail = data
                    self?.state = .loadedAll
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
        }
    }
}
