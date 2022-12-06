//
//  Season.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import Foundation

struct Season: Decodable {
    let id: Int
    let airDate: String?
    let episodeCount: Int
    let name: String
    let overview: String
    let posterPath: String?
    let seasonNumber: Int
    let episodes: [Episode]?
}
