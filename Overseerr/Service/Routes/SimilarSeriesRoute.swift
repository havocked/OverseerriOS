//
//  SimilarSeriesRoute.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import Foundation

struct SimilarSeriesRoute: APIRoute {
    let method = "GET"
    var path: String
    var query: [String:String] = [:]
    
    init(id: Int, page: Int) {
        path = "/api/v1/tv/\(id)/similar"
        query = ["page": String(page)]
    }
}
