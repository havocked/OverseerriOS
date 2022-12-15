//
//  APIService.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import Foundation
import OSLog

class APIService {
    
    /**All fetch calls **/
    
    func fetchDiscoverMovies(page: Int, completion: @escaping (Result<PaginatedResponse<MovieResult>, APIError>) -> Void) {
        fetch(route: DiscoverMoviesRoute(page: page), completion: completion)
    }
    
    func fetchUpcomingMovies(page: Int, completion: @escaping (Result<PaginatedResponse<MovieResult>, APIError>) -> Void) {
        fetch(route: UpcomingMoviesRoute(page: page), completion: completion)
    }
    
    func fetchMovieRecommendations(for id: Int, page: Int, completion: @escaping (Result<PaginatedResponse<MovieResult>, APIError>) -> Void) {
        fetch(route: RecommendedMoviesRoute(id: id, page: page), completion: completion)
    }
    
    func fetchSimilarMovies(for id: Int, page: Int, completion: @escaping (Result<PaginatedResponse<MovieResult>, APIError>) -> Void) {
        fetch(route: SimilarMoviesRoute(id: id, page: page), completion: completion)
    }
    
    func fetchDiscoverSeries(page: Int, completion: @escaping (Result<PaginatedResponse<TVResult>, APIError>) -> Void) {
        fetch(route: DiscoverSeriesRoute(page: page), completion: completion)
    }
    
    func fetchUpcomingSeries(page: Int, completion: @escaping (Result<PaginatedResponse<TVResult>, APIError>) -> Void) {
        fetch(route: UpcomingSeriesRoute(page: page), completion: completion)
    }
    
    func fetchSeriesRecommendations(for id: Int, page: Int, completion: @escaping (Result<PaginatedResponse<TVResult>, APIError>) -> Void) {
        fetch(route: RecommendedSeriesRoute(id: id, page: page), completion: completion)
    }
    
    func fetchSimilarSeries(for id: Int, page: Int, completion: @escaping (Result<PaginatedResponse<TVResult>, APIError>) -> Void) {
        fetch(route: SimilarSeriesRoute(id: id, page: page), completion: completion)
    }
    
    func fetchMovieDetails(for id: Int, completion: @escaping (Result<MovieDetails, APIError>) -> Void) {
        fetch(route: MovieDetailsRoute(id: id), completion: completion)
    }
    
    func fetchTVDetails(for id: Int, completion: @escaping (Result<TVDetails, APIError>) -> Void) {
        fetch(route: TVDetailsRoute(id: id), completion: completion)
    }
    
    func fetchPersonDetails(for id: Int, completion: @escaping (Result<PersonDetails, APIError>) -> Void) {
        fetch(route: PersonDetailsRoute(id: id), completion: completion)
    }
    
    func searchMedia(for term: String, page: Int, completion: @escaping (Result<PaginatedResponse<SearchMedia>, APIError>) -> Void) {
        fetch(route: SearchRoute(term: term, page: page), completion: completion)
    }
    
    func fetchCombinedCredits(for id: Int, completion: @escaping (Result<CombinedCredits, APIError>) -> Void) {
        fetch(route: CombinedCreditsRoute(id: id), completion: completion)
    }
    
    /** Basic implementation **/
    
    func build(for route: APIRoute) throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "overseerr.natflix.fr"
        urlComponents.path = route.path
        urlComponents.queryItems = route.query.map({ URLQueryItem(name: $0.key, value: $0.value) })
        guard let url = urlComponents.url else {
            throw APIError.badURL
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue(OverseerrSettings.shared.apiKey, forHTTPHeaderField: "X-Api-Key")
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        return urlRequest
    }
    
    func fetch<T: Decodable>(route: APIRoute, completion: @escaping(Result<T, APIError>) -> Void) {
        do {
            let urlRequest = try build(for: route)
            fetch(urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(.badURL))
        }
    }
    
    func fetch<T: Decodable>(urlRequest: URLRequest, completion: @escaping(Result<T,APIError>) -> Void) {
        let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "network")
        
        guard urlRequest.url != nil else {
            let error = APIError.badURL
            logger.log(level: .error, "\(error.localizedDescription)")
            completion(Result.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let result: Result<T,APIError>
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            logger.log(level: .debug, "\(urlRequest)")
            if let error = error as? URLError {
                result = .failure(APIError.urlSession(error))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                var errorMessage = "No error message"
                if let data = data {
                    errorMessage = String(data: data, encoding: .utf8) ?? "No error message"
                }
                let error = APIError.badResponse(response.statusCode, errorMessage)
                logger.log(level: .error, "\(error.localizedDescription)")
                result = .failure(error)
            } else if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    result = .success(decodedData)
                } catch {
                    let error = APIError.decoding(error as? DecodingError)
                    logger.log(level: .error, "\(error.localizedDescription)")
                    result = .failure(error)
                }
            } else {
                result = .failure(.unknown)
            }
        }.resume()
    }
}
