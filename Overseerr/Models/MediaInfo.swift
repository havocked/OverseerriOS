//
//  MediaInfo.swift
//  Overseerr
//
//  Created by Nataniel Martin on 02/12/2022.
//

import Foundation

struct MediaInfo: Decodable, Equatable {
    let mediaType: MediaType
    let status: MediaStatus
}
