//
//  TVResult.swift
//  Overseerr
//
//  Created by Nataniel Martin on 02/12/2022.
//

import Foundation

struct TVResult: Decodable {
    let id: Int
    let mediaType: MediaType
    let firstAirDate: String?
    let name: String
    let overview: String
    let backdropPath: String?
    let posterPath: String?
    let mediaInfo: MediaInfo?
}

extension TVResult {
    static let `default` = TVResult(
        id: 1,
        mediaType: .tv,
        firstAirDate: "2022-11-09",
        name: "Wednesday",
        overview: "Wednesday Addams is sent to Nevermore Academy, a bizarre boarding school where she attempts to master her psychic powers, stop a monstrous killing spree of the town citizens, and solve the supernatural mystery that affected her family 25 years ago — all while navigating her new relationships.",
        backdropPath: "/iHSwvRVsRyxpX7FE7GbviaDvgGZ.jpg",
        posterPath: "/jeGtaMwGxPmQN5xM4ClnwPQcNQz.jpg",
        mediaInfo: nil
    )
}
