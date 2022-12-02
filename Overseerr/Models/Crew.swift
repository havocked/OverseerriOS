//
//  Crew.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import Foundation

struct Crew: Decodable, Identifiable, Equatable {
    let creditId: String
    let department: String
    let id: Int
    let job: String
    let name: String
    let gender: Int
    let profilePath: String?
}

extension Crew {
    static let `default` = Crew(
        creditId: "1234",
        department: "Directing",
        id: 12345,
        job: "Director",
        name: "Aki Kaurismaki",
        gender: 2,
        profilePath: "/kiJErWEOv4Ew7aHOGKg4ljsmppZ.jpg"
    )
    
    static func `default`(customName: String = "John Doe", customJob: String = "Director", customId: String) -> Crew {
        return Crew(
            creditId: customId,
            department: "Directing",
            id: 12345,
            job: customJob,
            name: customName,
            gender: 2,
            profilePath: "/kiJErWEOv4Ew7aHOGKg4ljsmppZ.jpg"
        )
    }
}
