//
//  MyError.swift
//  AsyncWithCombine
//
//  Created by Kim Yewon on 2023/09/11.
//

import Foundation

enum MyError: Error {
    case networkError
    case noInternet
    case unknownNetworkError
    case decodingError(DecodingError)
    case genericError(Error)
}
