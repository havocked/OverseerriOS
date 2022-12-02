//
//  Colors+Extension.swift
//  Overseerr
//
//  Created by Nataniel Martin on 28/11/2022.
//

import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
    
    static let mainBackground: Color = Color(red: 0.07, green: 0.09, blue: 0.15, opacity: 1)
    static let grayBackground: Color = Color(red: 0.18, green: 0.22, blue: 0.28, opacity: 1)
}
