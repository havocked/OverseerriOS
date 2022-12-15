//
//  HeaderViewModel.swift
//  Overseerr
//
//  Created by Nataniel Martin on 30/11/2022.
//

import Foundation

class HeaderViewModel {
    
    let title: String
    private let runtime: Int?
    private let genres: [Genre]
    private let backdropPath: String?
    private let posterPath: String?
    
    convenience init(viewModel: MovieDetailViewModel) {
        self.init(title: viewModel.movie.title, runtime: viewModel.movie.runtime, genres: viewModel.movie.genres, backdropPath: viewModel.movie.backdropPath, posterPath: viewModel.movie.posterPath)
    }
    
    #warning("Need to find logic for runtime tv show")
    convenience init(viewModel: TVDetailViewModel) {
        self.init(title: viewModel.tv.name, runtime: nil, genres: viewModel.tv.genres, backdropPath: viewModel.tv.backdropPath, posterPath: viewModel.tv.posterPath)
    }
    
    init(title: String, runtime: Int?, genres: [Genre], backdropPath: String?, posterPath: String?) {
        self.title = title
        self.runtime = runtime
        self.genres = genres
        self.backdropPath = backdropPath
        self.posterPath = posterPath
    }
    
    var informations: String {
        var informations: [String] = []
        informations.append("PG-13")
        if let runtime = runtime {
            informations.append("\(runtime) minutes")
        }
        let genres = genres.map(\.name).joined(separator: ", ")
        informations.append(genres)
        return informations.joined(separator: " | ")
    }
    
    var backdropURL: URL? {
        return TMDBImage(size: .init(width: 400, height: 300), path: backdropPath).url
    }
    
    var posterURL: URL? {
        return TMDBImage(path: posterPath).url
    }
}
