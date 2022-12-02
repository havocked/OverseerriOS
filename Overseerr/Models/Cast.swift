//
//  Cast.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import Foundation

struct Cast: Decodable {
    let castId: Int
    let character: String
    let creditId: String
    let id: Int
    let name: String
    let order: Int
    let gender: Int
    let profilePath: String?
}

extension Cast {
    static let `default` = Cast(
        castId: 0,
        character: "Black Adam / Teth Adam",
        creditId: "59e392f39251410b67000225",
        id: 18918,
        name: "Dwayne Johnson",
        order: 0,
        gender: 2,
        profilePath: "/cgoy7t5Ve075naBPcewZrc08qGw.jpg"
    )
    
    static func `default`(customCreditId: String) -> Cast {
        return Cast(
            castId: 0,
            character: "Black Adam / Teth Adam",
            creditId: customCreditId,
            id: 18918,
            name: "Dwayne Johnson",
            order: 0,
            gender: 2,
            profilePath: "/cgoy7t5Ve075naBPcewZrc08qGw.jpg"
        )
    }
}

/*{
 "castId": 0,
 "character": "Black Adam / Teth Adam",
 "creditId": "59e392f39251410b67000225",
 "id": 18918,
 "name": "Dwayne Johnson",
 "order": 0,
 "gender": 2,
 "profilePath": "/cgoy7t5Ve075naBPcewZrc08qGw.jpg"
}*/
