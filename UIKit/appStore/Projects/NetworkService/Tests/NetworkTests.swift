//
//  NetworkTests.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim Yewon on 2023/09/18.
//

import Foundation
import NetworkService
import XCTest

final class NetworkTests: XCTestCase {
    
    func test_networkCall() {
        let data = NetworkManager.shared.request(path: APIPath.searchPath, query: "카카오")
        print(data)
        XCTAssertEqual("\(data.description)", "?")
    }
    func test_example() {
        XCTAssertEqual("NetworkTests", "NetworkTests")
    }
}
