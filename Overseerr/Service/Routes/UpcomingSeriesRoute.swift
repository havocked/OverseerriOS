//
//  UpcomingSeriesRoute.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import Foundation

struct UpcomingSeriesRoute: APIRoute {
    let method = "GET"
    var path = "/api/v1/discover/tv/upcoming"
    var query: [String:String] = [:]
    
    init(page: Int) {
        query = ["page": String(page)]
    }
}
