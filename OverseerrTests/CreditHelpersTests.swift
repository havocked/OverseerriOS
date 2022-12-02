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
            .default(customName: "Yolo Edit", customJob: "Editor", customId: "1234"),
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
            Crew(creditId: "12345", department: "Directing", id: 12345, job: "Director", name: "Yolo Director", gender: 2, profilePath: "/kiJErWEOv4Ew7aHOGKg4ljsmppZ.jpg"),
            Crew(creditId: "12347", department: "Directing", id: 12345, job: "Writer", name: "Yolo Writer", gender: 2, profilePath: "/kiJErWEOv4Ew7aHOGKg4ljsmppZ.jpg"),
            Crew(creditId: "1234", department: "Directing", id: 12345, job: "Editor", name: "Yolo Edit", gender: 2, profilePath: "/kiJErWEOv4Ew7aHOGKg4ljsmppZ.jpg"),
            Crew(creditId: "12346", department: "Directing", id: 12345, job: "Producer", name: "Yolo Producer", gender: 2, profilePath: "/kiJErWEOv4Ew7aHOGKg4ljsmppZ.jpg")
        ]
        XCTAssertEqual(testList, verifiedList)
    }
}
