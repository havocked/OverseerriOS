//
//  CombinedCreditsRoute.swift
//  Overseerr
//
//  Created by Nataniel Martin on 08/12/2022.
//

import Foundation

struct CombinedCreditsRoute: APIRoute {
    let method = "GET"
    var path: String
    var query: [String:String] = [:]
    
    init(id: Int) {
        path = "/api/v1/person/\(id)/combined_credits"
    }
}
