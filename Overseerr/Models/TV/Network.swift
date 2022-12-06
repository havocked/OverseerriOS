//
//  Network.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import Foundation

struct Network: Decodable {
    let id: Int
    let logoPath: String?
    let originCountry: String
    let name: String
}
