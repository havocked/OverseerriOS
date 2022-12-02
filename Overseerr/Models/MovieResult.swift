//
//  MovieResult.swift
//  Overseerr
//
//  Created by Nataniel Martin on 01/12/2022.
//

import Foundation

struct MovieResult: Decodable, Media {
    let id: Int
    let mediaType: MediaType
    let popularity: Double
    let posterPath: String?
    let backdropPath: String?
    let voteCount: Int
    let voteAverage: Double
    let genreIds: [Int]
    let overview: String
    let originalLanguage: String
    let title: String
    let originalTitle: String
    let releaseDate: String?
    let adult: Bool
    let video: Bool
    let mediaInfo: MediaInfo?
}

extension MovieResult {
    static let `default` = MovieResult(
        id: 436270,
        mediaType: .movie,
        popularity: 10405.742,
        posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
        backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
        voteCount: 2251,
        voteAverage: 7.3,
        genreIds: [28, 14, 979],
        overview: "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
        originalLanguage: "en",
        title: "Black Adam",
        originalTitle: "Black Adam",
        releaseDate: "2022-11-09",
        adult: false,
        video: false,
        mediaInfo: .init(status: .available)
    )
}

