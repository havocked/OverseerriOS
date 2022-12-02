//
//  APIRoute.swift
//  Overseerr
//
//  Created by Nataniel Martin on 02/12/2022.
//

import Foundation

protocol APIRoute {
    var method: String { get }
    var path: String { get set }
    var query: [String: String] { get set }
}
