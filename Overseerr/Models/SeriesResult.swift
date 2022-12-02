//
//  SeriesResult.swift
//  Overseerr
//
//  Created by Nataniel Martin on 01/12/2022.
//

import Foundation

struct SeriesResult: Decodable {
    var page: Int
    var totalPages: Int
    var totalResults: Int
    var results: [Series]
}
