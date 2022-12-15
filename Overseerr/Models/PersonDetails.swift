//
//  PersonDetails.swift
//  Overseerr
//
//  Created by Nataniel Martin on 08/12/2022.
//

import Foundation

struct PersonDetails: Decodable {
    let id: Int
    let name: String
    let profilePath: String?
    let adult: Bool
    let deathday: String?
    let knowForDepartement: String?
    let alsoKnownAs: [String]
    let gender: Int?
    let biography: String?
    let popularity: Double?
    let placeOfBirth: String?
    let imdbId: String?
    let homepage: String?
    
    init(result: PersonResult) {
        self.id = result.id
        self.name = result.name
        self.profilePath = result.profilePath
        self.adult = result.adult
        self.deathday = nil
        self.knowForDepartement = nil
        self.alsoKnownAs = []
        self.gender = nil
        self.biography = nil
        self.popularity = nil
        self.placeOfBirth = nil
        self.imdbId = nil
        self.homepage = nil
    }
}
