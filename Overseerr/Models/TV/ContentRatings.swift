//
//  ContentRatings.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import Foundation

struct Rating: Decodable {
    let iso_3166_1: String
    let rating: String
}

struct ContentRatings: Decodable {
    let results: [Rating]
}
