//
//  Cast.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import Foundation

struct Cast: Decodable {
    let id: Int
    let castId: Int
    let character: String
    let creditId: String
    let gender: Int
    let name: String
    let order: Int
    let profilePath: String?
}

extension Cast {
    static let `default` = Cast(
        id: 18918,
        castId: 0,
        character: "Black Adam / Teth Adam",
        creditId: "59e392f39251410b67000225",
        gender: 2,
        name: "Dwayne Johnson",
        order: 0,
        profilePath: "/cgoy7t5Ve075naBPcewZrc08qGw.jpg"
    )
    
    static func `default`(customCreditId: String) -> Cast {
        return Cast(
            id: 18918,
            castId: 0,
            character: "Black Adam / Teth Adam",
            creditId: customCreditId,
            gender: 2,
            name: "Dwayne Johnson",
            order: 0,
            profilePath: "/cgoy7t5Ve075naBPcewZrc08qGw.jpg"
        )
    }
}
