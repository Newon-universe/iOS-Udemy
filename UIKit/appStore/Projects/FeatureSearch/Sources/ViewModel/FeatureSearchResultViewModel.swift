//
//  FeatureSearchResultViewModel.swift
//  FeatureSearch
//
//  Created by Kim Yewon on 2023/09/21.
//  Copyright © 2023 labo.summer. All rights reserved.
//

import Foundation
import Combine
import Core
import NetworkService
import Utils

public final class FeatureSearchResultViewModel: ObservableObject {
    
//    struct Input {
//        let searchPublisher: AnyPublisher<String, Never>
//    }
    
//    struct Output {
//        let updateViewPublisher: AnyPublisher<[iTuensDataResponseModel], Never>
//    }
    
    private var cancellabels = Set<AnyCancellable>()
    @Published public var searchResults: [iTuensModel]
    
    public var histories: [String] {
        get {
            (UserDefaults.standard.array(forKey: UserDefaultsKeys.searchHistory.rawValue)?.tail as? [String] ?? [String]())
        }
        set {
            guard var history = UserDefaults.standard.array(forKey: UserDefaultsKeys.searchHistory.rawValue) else { return }
            if history.count > 10 { history.remove(at: 1) }
            history += newValue
            UserDefaults.standard.set(history, forKey: UserDefaultsKeys.searchHistory.rawValue)
        }
    }
    
    init(searchResults: iTuensDataResponseModel) {
        self.searchResults = searchResults.results ?? []
        
        if UserDefaults.standard.array(forKey: UserDefaultsKeys.searchHistory.rawValue) as? [String] ?? [String]() == [String]() {
            var history = UserDefaults.standard.array(forKey: UserDefaultsKeys.searchHistory.rawValue) as? [String] ?? [String]()
            history.append("최근 검색어")
            UserDefaults.standard.set(history, forKey: UserDefaultsKeys.searchHistory.rawValue)
        }
    }
    
    
    public func fetchApp(for searchTerm: String) {
        NetworkService<iTuensDataResponseModel, Error>.fetchApp(with: Endpoint.fetchApp(term: searchTerm)) { result in
            switch result {
            case .success(let response): DispatchQueue.main.async { self.searchResults = response.results ?? [] }
            case .failure(_): DispatchQueue.main.async { self.searchResults = [] }
            }
        }
    }
}
