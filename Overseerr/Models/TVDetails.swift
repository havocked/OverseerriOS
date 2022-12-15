//
//  TVDetails.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import Foundation

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
    let lastAirDate: String?
    let lastEpisodeToAir: Episode?
    let name: String
    let nextEpisodeToAir: Episode?
    let networks: [Network]
    let numberOfEpisodes: Int
    let numberOfSeasons: Int
    let originCountry: [String]
    let originalLanguage: String
    let originalName: String
    let overview: String
    let popularity: Double
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
        numberOfSeasons: Int,
        originCountry: [String],
        originalLanguage: String,
        originalName: String,
        overview: String,
        popularity: Double,
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
        self.numberOfSeasons = numberOfSeasons
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
        self.numberOfSeasons = 0
        self.originCountry = []
        self.originalLanguage = ""
        self.originalName = ""
        self.popularity = 0.0
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
