//
//  Crew.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import Foundation

struct Crew: Decodable, Identifiable, Equatable {
    let id: Int
    let creditId: String
    let gender: Int
    let name: String
    let job: String
    let department: String
    let profilePath: String?
}

extension Crew {
    static let `default` = Crew(
        id: 12345,
        creditId: "1234",
        gender: 2,
        name: "Director",
        job: "Aki Kaurismaki",
        department: "Directing",
        profilePath: "/kiJErWEOv4Ew7aHOGKg4ljsmppZ.jpg"
    )
    
    static func `default`(customName: String = "John Doe", customJob: String = "Director", customId: String) -> Crew {
        return Crew(
            id: 12345,
            creditId: customId,
            gender: 2,
            name: customName,
            job: customJob,
            department: "Directing",
            profilePath: "/kiJErWEOv4Ew7aHOGKg4ljsmppZ.jpg"
        )
    }
}
