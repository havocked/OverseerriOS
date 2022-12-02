//
//  PersonResult.swift
//  Overseerr
//
//  Created by Nataniel Martin on 01/12/2022.
//

import Foundation

struct PersonResult: Decodable {
    let id: Int
    let name: String
    let profilePath: String?
    let adult: Bool
}

extension PersonResult {
    static let `default` = PersonResult(
        id: 18918,
        name: "Dwayne Johnson",
        profilePath: "/cgoy7t5Ve075naBPcewZrc08qGw.jpg",
        adult: false
    )
}
