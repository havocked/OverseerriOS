//
//  Series.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import Foundation

struct Series: Media {
    static func == (lhs: Series, rhs: Series) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: Int
    var mediaType: MediaType
    var firstAirDate: String?
    var name: String
    var overview: String
    var backdropPath: String?
    var posterPath: String?
    var mediaInfo: MediaInfo?
    
    var releaseDate: String? {
        firstAirDate
    }
    
    var title: String {
        name
    }
}

extension Series {
    static let `default` = Series(
        id: 1,
        mediaType: .tv,
        firstAirDate: "2022-11-09",
        name: "Black Panther: Wakanda Forever",
        overview: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death. As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
        backdropPath: "/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg",
        posterPath: "/sv1xJUazXeYqALzczSZ3O6nkH75.jpg"
    )
}
