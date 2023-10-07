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
//    
//    struct Output {
//        let updateViewPublisher: AnyPublisher<[iTuensDataResponseModel], Never>
//    }
    
    private var cancellabels = Set<AnyCancellable>()
    @Published public var searchResults: [iTuensModel]
    var currentTerm: String? = nil
    
    public var isPagination = false
    
    public var histories: [String] {
        get {
            (UserDefaults.standard.array(forKey: UserDefaultsKeys.searchHistory.rawValue)?.tail as? [String] ?? [String]())
        }
        set {
            guard var history = UserDefaults.standard.array(forKey: UserDefaultsKeys.searchHistory.rawValue) as? [String],
                  let newValue = newValue.first,
                  !history.contains(newValue)
            else { return }

            if history.count > 10 { history.remove(at: 1) }
            history.append(newValue)
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
        guard searchResults.count % 10 == 0 else { return }
        currentTerm = searchTerm
        
        DispatchQueue.main.async { self.isPagination = true }
        NetworkService<iTuensDataResponseModel, Error>.fetchApp(with: Endpoint.fetchApp(term: searchTerm, offset: searchResults.count)) { result in
            switch result {
            case .success(let response): DispatchQueue.main.async { self.searchResults += response.results ?? []; self.isPagination = false }
            case .failure(_): DispatchQueue.main.async { self.searchResults = []; self.isPagination = false }
            }
        }
    }
    
    public func fetchAppAsync(for searchTerm: String) {
        guard searchResults.count % 10 == 0 else { return }
        currentTerm = searchTerm
        
        DispatchQueue.main.async { self.isPagination = true }
        NetworkService<iTuensDataResponseModel, Error>.fetchAppWithCombine(with: .fetchApp(term: searchTerm, offset: searchResults.count))
            .receive(on: DispatchQueue.main)
            .sink { status in
                switch status {
                case .finished: break
                case .failure(let error): print(error); self.searchResults = []
                }
            } receiveValue: { data in
                self.searchResults = data.results ?? []
            }
            .store(in: &cancellabels)
    }
    
    public func fetchAppAsync(for searchTerm: String) -> [iTuensDataResponseModel] {
        guard searchResults.count % 10 == 0 else { return [] }
        currentTerm = searchTerm
        
        DispatchQueue.main.async { self.isPagination = true }
    }
}
