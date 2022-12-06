//
//  ProductionCompany.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import Foundation

struct ProductionCompany: Decodable {
    let id: Int
    let logoPath: String?
    let originCountry: String
    let name: String
}
