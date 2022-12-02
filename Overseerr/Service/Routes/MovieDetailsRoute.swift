//
//  MovieDetailsRoute.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import Foundation

struct MovieDetailsRoute: APIRoute {
    let method = "GET"
    var path: String
    var query: [String:String] = [:]
    
    init(id: Int) {
        path = "/api/v1/movie/\(id)"
    }
}
