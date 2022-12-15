//
//  CombinedCredits.swift
//  Overseerr
//
//  Created by Nataniel Martin on 08/12/2022.
//

import Foundation

struct CreditCast: Decodable, Identifiable {
    let id: Int
    let name: String?
    let backdropPath: String?
    let posterPath: String?
    let character: String
    let mediaInfo: MediaInfo?
    let adult: Bool
    let mediaType: MediaType
}

struct CreditCrew: Decodable, Identifiable {
    let id: Int
    let name: String?
    let backdropPath: String?
    let posterPath: String?
    let mediaInfo: MediaInfo?
    let adult: Bool
    let mediaType: MediaType
}

struct CombinedCredits: Decodable {
    let id: Int
    let cast: [CreditCast]
    let crew: [CreditCrew]
}
