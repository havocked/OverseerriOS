//
//  TMDBImageTest.swift
//  OverseerrTests
//
//  Created by Nataniel Martin on 25/11/2022.
//

import XCTest
@testable import Overseerr

final class TMDBImageTest: XCTestCase {
    func testFullPath() throws {
        let tmdbImage = TMDBImage(size: .init(width: 500, height: 600), path: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg")
        XCTAssertEqual("https://image.tmdb.org/t/p/w500/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg", tmdbImage.url?.absoluteString)
    }
}
