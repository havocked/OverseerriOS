//
//  Badge.swift
//  Overseerr
//
//  Created by Nataniel Martin on 28/11/2022.
//

import SwiftUI


extension MediaStatus {
    var color: Color {
        switch self {
        case .unknown:
            return .clear
        case .pending:
            return .init(hex: 0xeab308) // Yellow
        case .processing:
            return .init(hex: 0x6366f1) // Indigo
        case .partiallyAvailable:
            return .init(hex: 0x22c55e) // Green
        case .available:
            return .init(hex: 0x22c55e) // Green
        }
    }
    
    var symbol: String {
        switch self {
        case .unknown:
            return ""
        case .pending:
            return "bell.circle.fill"
        case .processing:
            return "clock.circle.fill"
        case .partiallyAvailable:
            return "minus.circle.fill"
        case .available:
            return "checkmark.circle.fill"
        }
    }
}

struct Badge: View {
    let mediaStatus: MediaStatus
    
    var body: some View {
        Image(systemName: mediaStatus.symbol)
            .foregroundStyle(.white, mediaStatus.color)
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge(mediaStatus: .processing)
    }
}
