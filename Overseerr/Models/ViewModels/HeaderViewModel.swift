//
//  HeaderViewModel.swift
//  Overseerr
//
//  Created by Nataniel Martin on 30/11/2022.
//

import Foundation

class HeaderViewModel {
    private let movie: MovieDetails
    
    init(movie: MovieDetails) {
        self.movie = movie
    }
    
    var title: String {
        return movie.title
    }
    
    var informations: String {
        var informations: [String] = []
        informations.append("PG-13")
        if let runtime = movie.runtime {
            informations.append("\(runtime) minutes")
        }
        let genres = movie.genres.map({ $0.name }).joined(separator: ", ")
        informations.append(genres)
        return informations.joined(separator: " | ")
    }
    
    var backdropURL: URL? {
        return TMDBImage(size: .init(width: 400, height: 300), path: movie.backdropPath).url
    }
    
    var posterURL: URL? {
        return TMDBImage(path: movie.posterPath).url
    }
}
