//
//  MovieDetails.swift
//  Overseerr
//
//  Created by Nataniel Martin on 30/11/2022.
//

import Foundation

struct MovieDetails: Decodable {
    var id: Int
    var releaseDate: String?
    var title: String
    var overview: String
    var backdropPath: String?
    var posterPath: String?
    var mediaInfo: MediaInfo?
    var runtime: Int?
    
    var genres: [Genre]
    var tagline: String
    var credits: Credits
    
    init(movieResult: MovieResult) {
        self.id = movieResult.id
        self.releaseDate = movieResult.releaseDate
        self.title = movieResult.title
        self.overview = movieResult.overview
        self.backdropPath = movieResult.backdropPath
        self.posterPath = movieResult.posterPath
        self.mediaInfo = movieResult.mediaInfo
        
        self.genres = []
        self.tagline = ""
        self.credits = .init(cast: [], crew: [])
    }
}

extension MovieDetails {
    static func `default`(customGenres: [Genre] = [], runtime: Int? = nil) -> MovieDetails {
        let movieDetail = MovieDetails(movieResult: MovieResult.default)
        return movieDetail
    }
}
