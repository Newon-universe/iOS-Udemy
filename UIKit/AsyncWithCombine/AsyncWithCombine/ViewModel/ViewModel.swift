//
//  ViewModel.swift
//  AsyncWithCombine
//
//  Created by Kim Yewon on 2023/09/11.
//

import Foundation
import Combine

class ViewModel {
    func fetch_by_completion(completion: @escaping (Result<[Post], MyError>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(.genericError(error)))
                
            } else if let data = data,
                      let posts = try? JSONDecoder().decode([Post].self, from: data) {
                completion(.success(posts))
            } else {
                completion(.failure(.networkError))
                assertionFailure("unexpected. please investigate")
            }
            
        }.resume()
    }
    
    
    func fetch_by_async_combine() async -> AnyPublisher<[Post], MyError> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200 ... 299 ~= httpResponse.statusCode else {
                    throw MyError.networkError
                }
                return data
            }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .mapError { error in
                if let urlError = error as? URLError {
                    switch urlError.code {
                    case .notConnectedToInternet:
                        return MyError.noInternet
                    default:
                        return MyError.unknownNetworkError
                    }
                } else if let decodingError = error as? DecodingError {
                    return MyError.decodingError(decodingError)
                } else {
                    return MyError.genericError(error)
                }
            }
            .eraseToAnyPublisher()
    }
    
    
    func fetch_by_async_combine2() async -> AnyPublisher<[Post], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
    
    
    @available(*, deprecated, message: "Use fetch_by_async_combine instead")
    func legacy_fetchPosts() async -> Result<[Post], MyError> {
        return await withCheckedContinuation { continuation in
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, res, error in
                if let error = error {
                    continuation.resume(returning: .failure(.genericError(error)))
                } else if let data = data,
                          let posts = try? JSONDecoder().decode([Post].self, from: data) {
                    continuation.resume(returning: .success(posts))
                } else {
                    continuation.resume(returning: .failure(.unknownNetworkError))
                    assertionFailure("unexpected. please investigate")
                }
            }.resume()
        }
    }
    
    @available(*, deprecated, message: "Use fetch_by_async_combine instead")
    func legacyV2_fetchPosts() async throws -> [Post] {
        return try await withCheckedThrowingContinuation { continuation in
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, res, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let data = data,
                          let posts = try? JSONDecoder().decode([Post].self, from: data) {
                    continuation.resume(returning: posts)
                } else {
                    assertionFailure("unexpected. please investigate")
                }
            }.resume()
        }
    }
}
