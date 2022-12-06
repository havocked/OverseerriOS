//
//  TVDetails.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import Foundation

struct Season: Decodable {
    let id: Int
    let airDate: String
    let episodeCount: Int
    let name: String
    let overview: String
    let posterPath: String
    let seasonNumber: Int
    let episodes: [Episode]
}

struct Episode: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episodeNumber: Int
    let overview: String
    let productionCode: String
    let seasonNumber: Int
    let showId: Int
    let stillPath: String
    let voteAverage: Double
    let voteCount: Int
    
    static let `default` = Episode(
        id: 1,
        name: "Episode 1",
        airDate: "2022-12-06",
        episodeNumber: 1,
        overview: "Some overview",
        productionCode: "ABC123",
        seasonNumber: 1,
        showId: 1,
        stillPath: "some/path",
        voteAverage: 7.5,
        voteCount: 10
    )
}

struct CreatedBy: Decodable {
    let id: Int
    let name: String
    let gender: Int
    let profilePath: String
}

struct ContentRatings: Decodable {
    let results: [Rating]
}

struct Rating: Decodable {
    let iso_3166_1: String
    let rating: String
}

struct ProductionCompany: Decodable {
    let id: Int
    let logoPath: String
    let originCountry: String
    let name: String
}

struct Country: Decodable {
    let iso_3166_1: String
    let name: String
}

struct Network: Decodable {
    let id: Int
    let logoPath: String
    let originCountry: String
    let name: String
}

struct Language: Decodable {
    let englishName: String
    let iso_639_1: String
    let name: String
}

struct TVDetails: Decodable {
    let id: Int
    let backdropPath: String?
    let posterPath: String?
    let mediaInfo: MediaInfo?
    let contentRatings: ContentRatings
    let createdBy: [CreatedBy]
    let episodeRunTime: [Int]
    let firstAirDate: String?
    let genres: [Genre]
    let homepage: String
    let inProduction: Bool
    let languages: [String]
    let lastAirDate: String
    let lastEpisodeToAir: Episode
    let name: String
    let nextEpisodeToAir: Episode
    let networks: [Network]
    let numberOfEpisodes: Int
    let numberOfSeason: Int
    let originCountry: [String]
    let originalLanguage: String
    let originalName: String
    let overview: String
    let popularity: Int
    let productionCompanies: [ProductionCompany]
    let productionCountries: [Country]
    let spokenLanguages: [Language]
    let seasons: [Season]
    let status: String
    let tagline: String
    let type: String
    let voteAverage: Double
    let voteCount: Int
    let credits: Credits
    
    init(
        id: Int,
        backdropPath: String? = nil,
        posterPath: String? = nil,
        mediaInfo: MediaInfo? = nil,
        contentRatings: ContentRatings,
        createdBy: [CreatedBy],
        episodeRunTime: [Int],
        firstAirDate: String? = nil,
        genres: [Genre],
        homepage: String,
        inProduction: Bool,
        languages: [String],
        lastAirDate: String,
        lastEpisodeToAir: Episode,
        name: String,
        nextEpisodeToAir: Episode,
        networks: [Network],
        numberOfEpisodes: Int,
        numberOfSeason: Int,
        originCountry: [String],
        originalLanguage: String,
        originalName: String,
        overview: String,
        popularity: Int,
        productionCompanies: [ProductionCompany],
        productionCountries: [Country],
        spokenLanguages: [Language],
        seasons: [Season],
        status: String,
        tagline: String,
        type: String,
        voteAverage: Double,
        voteCount: Int,
        credits: Credits
    ) {
        self.id = id
        self.backdropPath = backdropPath
        self.posterPath = posterPath
        self.firstAirDate = firstAirDate
        self.name = name
        self.overview = overview
        self.mediaInfo = mediaInfo
        
        self.contentRatings = contentRatings
        self.createdBy = createdBy
        self.episodeRunTime = episodeRunTime
        self.genres = genres
        self.homepage = homepage
        self.inProduction = inProduction
        self.languages = languages
        self.lastAirDate = lastAirDate
        self.lastEpisodeToAir = lastEpisodeToAir
        self.nextEpisodeToAir = nextEpisodeToAir
        self.networks = networks
        self.numberOfEpisodes = numberOfEpisodes
        self.numberOfSeason = numberOfSeason
        self.originCountry = originCountry
        self.originalLanguage = originalLanguage
        self.originalName = originalName
        self.popularity = popularity
        self.productionCompanies = productionCompanies
        self.productionCountries = productionCountries
        self.spokenLanguages = spokenLanguages
        self.seasons = seasons
        self.status = status
        self.tagline = tagline
        self.type = type
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.credits = credits
       
    }
    
    init(tvResult: TVResult) {
        self.id = tvResult.id
        self.backdropPath = tvResult.backdropPath
        self.posterPath = tvResult.posterPath
        self.firstAirDate = tvResult.firstAirDate
        self.name = tvResult.name
        self.overview = tvResult.overview
        self.mediaInfo = tvResult.mediaInfo
        
        self.contentRatings = .init(results: [])
        self.createdBy = []
        self.episodeRunTime = []
        self.genres = []
        self.homepage = ""
        self.inProduction = false
        self.languages = []
        self.lastAirDate = ""
        self.lastEpisodeToAir = .default
        self.nextEpisodeToAir = .default
        self.networks = []
        self.numberOfEpisodes = 0
        self.numberOfSeason = 0
        self.originCountry = []
        self.originalLanguage = ""
        self.originalName = ""
        self.popularity = 0
        self.productionCompanies = []
        self.productionCountries = []
        self.spokenLanguages = []
        self.seasons = []
        self.status = ""
        self.tagline = ""
        self.type = ""
        self.voteAverage = 0
        self.voteCount = 0
        self.credits = .init(cast: [], crew: [])
    }
}

//extension TVDetails {
//    static func `default`() -> TVDetails {
//        TVDetails(
//            id: 1,
//            backdropPath: "",
//            posterPath: "",
//            contentRatings: .init(results: []),
//            createdBy: [],
//            episodeRunTime: [],
//            firstAirDate: "",
//            genres: [.init(id: 1, name: "yolo")],
//            homepage: "",
//            inProduction: true,
//            languages: [],
//            lastAirDate: "",
//            lastEpisodeToAir: .default,
//            name: "",
//            nextEpisodeToAir: .default,
//            networks: [],
//            numberOfEpisodes: 4,
//            numberOfSeason: 2,
//            originCountry: [],
//            originalLanguage: "",
//            originalName: "",
//            overview: "",
//            popularity: 1,
//            productionCompanies: [],
//            productionCountries: [],
//            spokenLanguages: [],
//            seasons: [],
//            status: "",
//            tagline: "",
//            type: "",
//            voteAverage: 12.2,
//            voteCount: 12,
//            credits: .init(cast: [.default], crew: [.default])
//        )
//    }
//}
