//
//  OverseerrConstants.swift
//  Overseerr
//
//  Created by Nataniel Martin on 02/12/2022.
//

import Foundation

struct OverseerrSettings: Decodable {
    static let shared = OverseerrSettings()
    
    let apiKey: String
    
    private init() {
        guard let plistFileURL = Bundle.main.url(forResource: "OverseerrSettings", withExtension: "plist") else {
            fatalError("Missing OverseerrSettings.plist file in the xcode project")
        }
        
        guard let plistData = try? Data(contentsOf: plistFileURL) else {
            fatalError("Data in OverseerrSettings.plist corrupted")
        }

        let decoder = PropertyListDecoder()

        guard let newSettings = try? decoder.decode(OverseerrSettings.self, from: plistData) else {
            fatalError("Failed to decode OverseerrSettings in OverseerrSettings.plist")
        }
        
        self = newSettings
    }
}
