//
//  RecommendedSeriesRoute.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

struct RecommendedSeriesRoute: APIRoute {
    let method = "GET"
    var path: String
    var query: [String:String] = [:]
    
    init(id: Int, page: Int) {
        path = "/api/v1/tv/\(id)/recommendations"
        query = ["page": String(page)]
    }
}
