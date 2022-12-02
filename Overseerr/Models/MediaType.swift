//
//  MediaType.swift
//  Overseerr
//
//  Created by Nataniel Martin on 02/12/2022.
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
