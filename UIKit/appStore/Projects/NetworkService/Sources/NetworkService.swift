//
//  Network.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim Yewon on 2023/09/18.
//

import UIKit
import Combine

class NetworkService<T: Decodable, E: Error> {
    enum NetworkServiceError: Error {
        case serverError(E)
        case unknownError(String = "An unkown error occurred.")
        case decodingError(String = "Error parsing server response.")
    }
    
    static func fetchApp(with endpoint: Endpoint, completion: @escaping (Result<[T], NetworkServiceError>) -> Void) {
        guard let request = endpoint.request else { return }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(.unknownError(error.localizedDescription)))
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                // Todo - Handle response
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let appSearchData = try decoder.decode([T].self, from: data)
                    completion(.success(appSearchData))
                } catch let error {
                    completion(.failure(.decodingError()))
                    print(error.localizedDescription)
                }
            } else {
                completion(.failure(.unknownError()))
            }
        }
        .resume()
    }
}
