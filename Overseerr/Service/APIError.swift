//
//  APIError.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    
    case badURL
    case urlSession(URLError?)
    case badResponse(Int, String)
    case decoding(DecodingError?)
    case unknown
    
    var description: String {
        switch self {
        case .badURL:
            return "badURL"
        case .urlSession(let error):
            return "urlSession error: \(error.debugDescription)"
        case .badResponse(let statusCode, let errorMessage):
            return "bad response with status code: \(statusCode): \(errorMessage)"
        case .decoding(let decodingError):
            guard let decodingError = decodingError else { return "Unknown decoding error" }
            return "decoding error: \(decodingError)"
        case .unknown:
            return "unknown error"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .badURL, .unknown:
            return "something went wrong"
        case .urlSession(let urlError):
            return urlError?.localizedDescription ?? "something went wrong"
        case .badResponse(let statusCode, let errorMessage):
            return "Bad response with code [\(statusCode)]: \(errorMessage)"
        case .decoding(let decodingError):
            return decodingError?.localizedDescription ?? "something went wrong"
        }
    }
}
