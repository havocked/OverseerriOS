//
//  MovieDetail.swift
//  Overseerr
//
//  Created by Nataniel Martin on 30/11/2022.
//

import Foundation

struct MovieDetail: Decodable {
    
    struct Genre: Decodable {
        let id: Int
        let name: String
    }
    
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
    
    init(media: any Media) {
        self.id = media.id
        self.releaseDate = media.releaseDate
        self.title = media.title
        self.overview = media.overview
        self.backdropPath = media.backdropPath
        self.posterPath = media.posterPath
        self.mediaInfo = media.mediaInfo
        
        self.genres = []
        self.tagline = ""
        self.credits = .init(cast: [], crew: [])
    }
}

extension MovieDetail {
    static func `default`(customGenres: [MovieDetail.Genre] = [], runtime: Int? = nil) -> MovieDetail {
        let movie = Movie(
            id: 100,
            mediaType: MediaType.movie,
            releaseDate: "2022-11-09",
            title: "Black Panther: Wakanda Forever",
            overview: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death. As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
            backdropPath: "/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg",
            posterPath: "/sv1xJUazXeYqALzczSZ3O6nkH75.jpg",
            mediaInfo: .init(status: .processing)
        )
        var movieDetail = MovieDetail(media: movie)
        movieDetail.genres = customGenres
        movieDetail.runtime = runtime
        return movieDetail
    }
}
