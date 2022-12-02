//
//  SearchRoute.swift
//  Overseerr
//
//  Created by Nataniel Martin on 01/12/2022.
//

import Foundation

struct SearchRoute: APIRoute {
    let method = "GET"
    var path: String = "/api/v1/search"
    var query: [String:String]
    
    init(term: String, page: Int) {
        query = ["query": term, "page": "\(page)"]
    }
}
