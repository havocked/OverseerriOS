//
//  CreditHelpersTests.swift
//  OverseerrTests
//
//  Created by Nataniel Martin on 29/11/2022.
//

import XCTest
@testable import Overseerr

final class CreditHelpersTests: XCTestCase {
    func testExample() throws {
        let crewList: [Crew] = [
            .default(customName: "Yolo Producer", customJob: "Producer", customId: "12346"),
            .default(customName: "Yolo Writer", customJob: "Writer", customId: "12347"),
            .default(customName: "Yolo Photo", customJob: "Director of Photography", customId: "12234"),
            .default(customName: "Yolo Edit", customJob: "Editor", customId: "12349"),
            .default(customName: "Yolo ProducDesignor", customJob: "Production Design", customId: "122234"),
            .default(customName: "Yolo Custom", customJob: "Costume Design", customId: "1233334"),
            .default(customName: "Yolo ProdMan", customJob: "Production Manager", customId: "1277734"),
            .default(customName: "Yolo Sounder", customJob: "Sound", customId: "1276534"),
            .default(customName: "Yolo Soundassistant", customJob: "Sound Assistant", customId: "1212334"),
            .default(customName: "Yolo Gaffer", customJob: "Gaffer", customId: "14444234"),
            .default(customName: "Yolo Music", customJob: "Music", customId: "1298767734"),
            .default(customName: "Yolo AssistDirect", customJob: "Assistant Director", customId: "1234112212"),
            .default(customName: "Yolo LocaMana", customJob: "Location Manager", customId: "123323232224"),
            .default(customName: "Yolo PohtoStill", customJob: "Still Photographer", customId: "12099900034"),
            .default(customName: "Yolo ScriptorSup", customJob: "Script Supervisor", customId: "1233459874"),
            .default(customName: "Yolo CostAssistant", customJob: "Costume Assistant", customId: "122345670934"),
            .default(customName: "Yolo AssistantEditor", customJob: "Assistant Editor", customId: "1200023434"),
            .default(customName: "Yolo Director", customJob: "Director", customId: "12345")
        ]
        
        let testList = crewList.sortCrewPriority()
        let verifiedList = [
            Crew(id: 12345, creditId: "12345", gender: 2, name: "Yolo Director", job: "Director", department: "Directing", profilePath: "/kiJErWEOv4Ew7aHOGKg4ljsmppZ.jpg"),
            Crew(id: 12345, creditId: "12347", gender: 2, name: "Yolo Writer", job: "Writer", department: "Directing", profilePath: "/kiJErWEOv4Ew7aHOGKg4ljsmppZ.jpg"),
            Crew(id: 12345, creditId: "12349", gender: 2, name: "Yolo Edit", job: "Editor", department: "Directing", profilePath: "/kiJErWEOv4Ew7aHOGKg4ljsmppZ.jpg"),
            Crew(id: 12345, creditId: "12346", gender: 2, name: "Yolo Producer", job: "Producer", department: "Directing", profilePath: "/kiJErWEOv4Ew7aHOGKg4ljsmppZ.jpg")
        ]
        XCTAssertEqual(testList, verifiedList)
    }
}
