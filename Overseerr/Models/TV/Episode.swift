//
//  Episode.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import Foundation

struct Episode: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episodeNumber: Int
    let overview: String
    let productionCode: String
    let seasonNumber: Int
    let showId: Int
    let stillPath: String?
    let voteAverage: Double
    let voteCount: Int?
    
    static let `default` = Episode(
        id: 1,
        name: "Episode 1",
        airDate: "2022-12-06",
        episodeNumber: 1,
        overview: "Some overview",
        productionCode: "ABC123",
        seasonNumber: 1,
        showId: 1,
        stillPath: "/vlEEQeTNLV9qBIe293AliKWykH5.jpg",
        voteAverage: 7.5,
        voteCount: 10
    )
}
