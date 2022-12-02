//
//  Media.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import SwiftUI

protocol Media: Decodable, Identifiable {
    var id: Int { get }
    var mediaType: MediaType { get }
    var releaseDate: String? { get }
    var title: String { get }
    var overview: String { get }
    var backdropPath: String? { get }
    var posterPath: String? { get }
    var mediaInfo: MediaInfo? { get }
}
