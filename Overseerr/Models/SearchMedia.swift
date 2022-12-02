//
//  SearchMedia.swift
//  Overseerr
//
//  Created by Nataniel Martin on 01/12/2022.
//

import Foundation

enum SearchMedia: Decodable, Identifiable {
    var id: Int {
        switch self {
        case .movie(let movie):
            return movie.id
        case .tv(let tv):
            return tv.id
        case .person(let person):
            return person.id
        }
    }
    
    case movie(Movie)
    case tv(Series)
    case person(PersonResult)
    
    enum CodingKeys: CodingKey {
        case mediaType
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(MediaType.self, forKey: .mediaType)
        
        switch type {
        case .person:
            let data = try PersonResult.init(from: decoder)
            self = .person(data)
        case .movie:
            let data = try Movie.init(from: decoder)
            self = .movie(data)
        case .tv:
            let data = try Series.init(from: decoder)
            self = .tv(data)
        }
    }
}
