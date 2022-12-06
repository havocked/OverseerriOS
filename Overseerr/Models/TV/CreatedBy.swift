//
//  CreatedBy.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import Foundation

struct CreatedBy: Decodable {
    let id: Int
    let name: String
    let gender: Int
    let profile_path: String?
}
