//
//  MediaViewModel.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import Foundation

protocol MediaViewModel: ObservableObject {
    var results: [SearchMedia] { get set }
    var state: FetchState { get set }
    
    func clear()
    func loadMore()
    func fetchMedias()
}
