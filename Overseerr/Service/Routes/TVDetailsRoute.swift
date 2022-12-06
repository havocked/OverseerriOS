//
//  TVDetailsRoute.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import Foundation

struct TVDetailsRoute: APIRoute {
    let method = "GET"
    var path: String
    var query: [String:String] = [:]
    
    init(id: Int) {
        path = "/api/v1/tv/\(id)"
    }
}
