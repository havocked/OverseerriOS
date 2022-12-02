//
//  MediaStatus.swift
//  Overseerr
//
//  Created by Nataniel Martin on 02/12/2022.
//

import Foundation

enum MediaStatus: Int, Decodable {
    case unknown = 1
    case pending
    case processing
    case partiallyAvailable
    case available
}
