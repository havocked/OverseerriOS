//
//  Media.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import SwiftUI

enum MediaType: String, Decodable, CaseIterable, Identifiable {
    case movie
    case tv
    case person
    
    var id: String { self.rawValue }
}

extension MediaType {
    var title: String {
        switch self {
        case .movie:
            return "Movie".uppercased()
        case .tv:
            return "Series".uppercased()
        case .person:
            return "Person".uppercased()
        }
    }
    
    var color: Color {
        switch self {
        case .movie:
            return .blue
        case .tv:
            return .purple
        case .person:
            return .orange
        }
    }
}

enum MediaStatus: Int, Decodable {
    case unknown = 1
    case pending
    case processing
    case partiallyAvailable
    case available
}

struct MediaInfo: Decodable {
    let status: MediaStatus
}

protocol Media: Decodable, Identifiable, Equatable {
    var id: Int { get }
    var mediaType: MediaType { get }
    var releaseDate: String? { get }
    var title: String { get }
    var overview: String { get }
    var backdropPath: String? { get }
    var posterPath: String? { get }
    var mediaInfo: MediaInfo? { get }
}
