//
//  PaginatedResponse.swift
//  Overseerr
//
//  Created by Nataniel Martin on 02/12/2022.
//

import Foundation

struct PaginatedResponse<T: Decodable>: Decodable {
    var page: Int
    var totalPages: Int
    var totalResults: Int
    var results: [T]
}
