//
//  FetchState.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case error(String)
}
