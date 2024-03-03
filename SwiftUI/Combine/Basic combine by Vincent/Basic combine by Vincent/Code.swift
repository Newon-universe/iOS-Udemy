//
//  Code.swift
//  Basic combine by Vincent
//
//  Created by Kim Yewon on 1/19/24.
//

import Foundation

func run() {
    
}


// Before use Combine, it gonna be very complex.

//func fetchUserId(_ completionHandler: @escaping (Result<Int, Error>) -> Void) {
//    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//        let result = 42
//        completionHandler(.success(result))
//    }
//}
//
//func fetchName(for userId: Int, _ completionHandler: @escaping (Result<String, Error>) -> Void) {
//    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//        let result = "Newon"
//        completionHandler(.success(result))
//    }
//}
//
//func run() {
//    fetchUserId { userIdResult in
//        switch userIdResult {
//        case .success(let userId): 
//            fetchName(for: userId) { nameResult in
//                switch nameResult {
//                case .success(let name):
//                    print(name)
//                case .failure(let error):
//                    break // do something
//                }
//            }
//        case .failure(let failure):
//            //do something
//            break
//        }
//    }
//}

