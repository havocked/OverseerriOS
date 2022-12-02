//
//  APIService.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import Foundation
import OSLog

protocol APIRoute {
    var method: String { get }
    var path: String { get set }
    var query: [String: String] { get set }
}

class APIService {
    
    /**All fetch calls **/
    
    func fetchDiscoverMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        do {
            let urlRequest = try build(for: DiscoverMoviesRoute(page: page))
            fetch(type: MovieResult.self, urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(.badURL))
        }
    }
    
    func fetchUpcomingMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        do {
            let urlRequest = try build(for: UpcomingMoviesRoute(page: page))
            fetch(type: MovieResult.self, urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(.badURL))
        }
    }
    
    func fetchDiscoverSeries(page: Int, completion: @escaping (Result<SeriesResult, APIError>) -> Void) {
        do {
            let urlRequest = try build(for: DiscoverSeriesRoute(page: page))
            fetch(type: SeriesResult.self, urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(.badURL))
        }
    }
    
    func fetchUpcomingSeries(page: Int, completion: @escaping (Result<SeriesResult, APIError>) -> Void) {
        do {
            let urlRequest = try build(for: UpcomingSeriesRoute(page: page))
            fetch(type: SeriesResult.self, urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(.badURL))
        }
    }
    
    func fetchSeriesRecommendations(for id: Int, page: Int, completion: @escaping (Result<SeriesResult, APIError>) -> Void) {
        do {
            let urlRequest = try build(for: RecommendedSeriesRoute(id: id, page: page))
            fetch(type: SeriesResult.self, urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(.badURL))
        }
    }
    
    func fetchSimilarSeries(for id: Int, page: Int, completion: @escaping (Result<SeriesResult, APIError>) -> Void) {
        do {
            let urlRequest = try build(for: SimilarSeriesRoute(id: id, page: page))
            fetch(type: SeriesResult.self, urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(.badURL))
        }
    }
    
    func fetchMovieRecommendations(for id: Int, page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        do {
            let urlRequest = try build(for: RecommendedMoviesRoute(id: id, page: page))
            fetch(type: MovieResult.self, urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(.badURL))
        }
    }
    
    func fetchSimilarMovies(for id: Int, page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        do {
            let urlRequest = try build(for: SimilarMoviesRoute(id: id, page: page))
            fetch(type: MovieResult.self, urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(.badURL))
        }
    }
    
    func fetchMoviesDetails(for id: Int, completion: @escaping (Result<MovieDetail, APIError>) -> Void) {
        do {
            let urlRequest = try build(for: MovieDetailsRoute(id: id))
            fetch(type: MovieDetail.self, urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(.badURL))
        }
    }
    
    func searchMedia(for term: String, page: Int, completion: @escaping (Result<SearchResult, APIError>) -> Void) {
        do {
            let urlRequest = try build(for: SearchRoute(term: term, page: page))
            fetch(type: SearchResult.self, urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(.badURL))
        }
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
    
    func fetch<T: Decodable>(type: T.Type, urlRequest: URLRequest, completion: @escaping(Result<T,APIError>) -> Void) {
        let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "network")
        
        guard urlRequest.url != nil else {
            let error = APIError.badURL
            logger.log(level: .error, "\(error.localizedDescription)")
            completion(Result.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            logger.log(level: .debug, "\(urlRequest)")
            if let error = error as? URLError {
                completion(Result.failure(APIError.urlSession(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                var errorMessage = "No error message"
                if let data = data {
                    errorMessage = String(data: data, encoding: .utf8) ?? "No error message"
                }
                let error = APIError.badResponse(response.statusCode, errorMessage)
                logger.log(level: .error, "\(error.localizedDescription)")
                completion(Result.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    let error = APIError.decoding(error as? DecodingError)
                    logger.log(level: .error, "\(error.localizedDescription)")
                    completion(Result.failure(error))
                }
            }
        }.resume()
    }
}
