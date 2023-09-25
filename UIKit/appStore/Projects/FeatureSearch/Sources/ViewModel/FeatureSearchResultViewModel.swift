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
    
    private var cancellabels = Set<AnyCancellable>()
    
    @Published public var searchResults: [SearchResult] = []
    
    public var histories: [String] {
        get {
            (UserDefaults.standard.array(forKey: UserDefaultsKeys.searchHistory.rawValue) as? [String] ?? [String]())
        }
        set {
            var attachValue = newValue
            if attachValue.count >= 10 { attachValue.remove(at: 1) }
            UserDefaults.standard.set(attachValue, forKey: UserDefaultsKeys.searchHistory.rawValue)
        }
    }
    
    func requestResponse() {
        
    }
    
    init(cancellabels: Set<AnyCancellable> = Set<AnyCancellable>(), searchResults: [SearchResult]) {
        self.cancellabels = cancellabels
        self.searchResults = searchResults
        
        if UserDefaults.standard.array(forKey: UserDefaultsKeys.searchHistory.rawValue) as? [String] ?? [String]() == [String]() {
            var history = UserDefaults.standard.array(forKey: UserDefaultsKeys.searchHistory.rawValue) as? [String] ?? [String]()
            history.append("최근 검색어")
            UserDefaults.standard.set(history, forKey: UserDefaultsKeys.searchHistory.rawValue)
        }
    }
    
    init() {
        searchResults = []
    }
}
