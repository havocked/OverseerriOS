//
//  Movie.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import Foundation

struct Movie: Media {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: Int
    var mediaType: MediaType
    var releaseDate: String?
    var title: String
    var overview: String
    var backdropPath: String?
    var posterPath: String?
    var mediaInfo: MediaInfo?
}

extension Movie {
    static let `default` = Movie(
        id: 100,
        mediaType: MediaType.movie,
        releaseDate: "2022-11-09",
        title: "Black Panther: Wakanda Forever",
        overview: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death. As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
        backdropPath: "/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg",
        posterPath: "/sv1xJUazXeYqALzczSZ3O6nkH75.jpg",
        mediaInfo: .init(status: .processing)
    )
}
