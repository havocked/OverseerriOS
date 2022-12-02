//
//  TMDBImage.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import SwiftUI

struct TMDBImage {
    let baseURL = "https://image.tmdb.org"
    let size: CGSize
    let path: String
    
    var url: URL? {
        return URL(string: "\(baseURL)/t/p/w\(Int(size.width))\(path)")
    }
    
    init(size: CGSize = .init(width: 500, height: 300), path: String?) {
        self.size = size
        self.path = path ?? ""
    }
}

extension TMDBImage {
    static let `default` = TMDBImage(path: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg")
}
