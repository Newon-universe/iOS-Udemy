//
//  FeatureSearchTests.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim Yewon on 2023/09/18.
//

import Foundation
import FeatureSearch
import NetworkService
import Utils
import XCTest

final class FeatureSearchTests: XCTestCase {
    
    func test_fetchApp() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch App Expectation")
        let endpoint = Endpoint.fetchApp(term: "카카오파리채")

        // When
        NetworkService<iTuensDataResponseModel, Error>.fetchApp(with: endpoint) { result in
            switch result {
            case .success(let response):
                // Then
                print("Response received:")
                print(response)
                XCTAssertGreaterThan(response.resultCount ?? 0, 0)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Error: \(error)")
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 5.0)
    }
    
    func test_example() {
        XCTAssertEqual("FeatureSearchTests", "FeatureSearchTests")
    }
}
