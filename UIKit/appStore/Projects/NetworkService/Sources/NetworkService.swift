//
//  Network.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim Yewon on 2023/09/18.
//

import UIKit
import Combine



public class NetworkService<T: Decodable, E: Error> {
    public enum NetworkServiceError: Error {
        case networkError
        case noInternet
        case unknownNetworkError
        case decodingError(DecodingError)
        case serverError(String)
    }
    
    public static func fetchApp(with endpoint: Endpoint, completion: @escaping (Result<T, NetworkServiceError>) -> Void) {
        guard let request = endpoint.request else { return }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(.unknownNetworkError))
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                completion(.failure(.networkError))
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let appSearchData = try decoder.decode(T.self, from: data)
                    completion(.success(appSearchData))
                } catch let error {
                    if let error = error as? DecodingError{
                        completion(.failure(.decodingError(error)))
                    } else {
                        completion(.failure(.unknownNetworkError))
                    }
                    print(error.localizedDescription)
                    
                }
            } else {
                completion(.failure(.unknownNetworkError))
            }
        }
        .resume()
    }
    
    public static func fetchAsyncApp(with endpoint: Endpoint) async -> AnyPublisher<T, NetworkServiceError> {
        guard let request = endpoint.request?.url else { return Fail(error: NetworkServiceError.noInternet).eraseToAnyPublisher() }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200 ... 299 ~= httpResponse.statusCode else {
                    throw NetworkServiceError.networkError
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let urlError = error as? URLError {
                    switch urlError.code {
                    case .notConnectedToInternet:
                        return NetworkServiceError.noInternet
                    default:
                        return NetworkServiceError.unknownNetworkError
                    }
                } else if let decodingError = error as? DecodingError {
                    return NetworkServiceError.decodingError(decodingError)
                } else {
                    return NetworkServiceError.serverError(error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
    }
    
}
