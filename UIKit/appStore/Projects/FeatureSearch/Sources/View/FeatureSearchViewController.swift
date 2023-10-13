//
//  FeatureSearchViewController.swift
//  FeatureSearch
//
//  Created by Kim Yewon on 2023/09/19.
//  Copyright © 2023 labo.summer. All rights reserved.
//

import UIKit
import Combine
import CombineCocoa
import SnapKit
import Core
import NetworkService
import UI
import Utils

public class FeatureSearchViewController: UIViewController {
    private var cancellabels = Set<AnyCancellable>()
    private var resultViewModel = FeatureSearchResultViewModel(searchResults: iTuensDataResponseModel(from: nil))
    
    private lazy var resultController = FeatureSearchResultViewController(navigationController: navigationController, viewModel: resultViewModel)
    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: resultController)
        
        controller.searchBar.textDidChangePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.resultController.reloadHistorySnapshot(currentText: value)
            }
            .store(in: &cancellabels)
        
        controller.searchBar.searchButtonClickedPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                if let value = controller.searchBar.text {
                    self?.resultViewModel.histories = [value]
                    self?.searchValueSubject.send(value)
//                    self?.resultViewModel.fetchAppAsync(for: value)
                }
            }
            .store(in: &self.cancellabels)
        
        controller.searchBar.cancelButtonClickedPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.resultViewModel.searchResults = []
                self?.tableView.reloadData()
            }
            .store(in: &self.cancellabels)
        
        return controller
    }()
    private lazy var searchValueSubject: PassthroughSubject<String, Never> = .init()
    
    private let titleLabel: UILabel = UILabelFactory.build(text: "검색", font: AppStoreFont.bold(ofSize: AppStoreSize.titleSize))
    private lazy var profileIcon: UIButton = {
        let button = UIButtonFactory.build(image: UIImage(systemName: "person.crop.circle"))
        return button
    }()
    
    private lazy var titleView: UIStackView = {
        let widthSpacer = DividerFactory.build(width: CGFloat.greatestFiniteMagnitude)
        let contentView = UIStackView(
            arrangedSubviews: [titleLabel, widthSpacer, profileIcon]
        )
        contentView.axis = .horizontal
        
        return contentView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.didSelectRowPublisher
            .sink {
                tableView.deselectRow(at: $0, animated: true)
                let term = self.resultViewModel.histories[$0.item - 1]
                DispatchQueue.main.async {
                    self.resultViewModel.fetchApp(for: term)
                    self.searchController.searchBar.text = term
                    self.searchController.isActive = true
                    self.searchController.showsSearchResultsController = true
                }
            }
            .store(in: &cancellabels)
        
        return tableView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        settingSearchController()
        layout()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    
    private func layout() {
        self.view.backgroundColor = UIAsset.white.color
        view.addSubview(tableView)
        
        if let profileIcon = profileIcon.imageView {
            profileIcon.snp.makeConstraints { make in
                make.height.equalTo(AppStoreSize.titleSize)
                make.width.equalTo(profileIcon.snp.height)
            }
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(AppStoreSize.defaultPadding)
            make.left.equalToSuperview()
            make.right.equalToSuperview().offset(-AppStoreSize.defaultPadding)
            make.bottom.equalToSuperview().offset(-AppStoreSize.defaultPadding)
        }
    }
    
//    func bind() {
//        let input = FeatureSearchResultViewModel.Input(
//            searchPublisher: searchClickedValuePublisher,
//            userButtonTapPublisher: profileIcon.tapPublisher
//        )
//        
//        let output = resultViewModel.transform(input: input)
//        
//        output.fetchAppPublisher.sink { status in
//            switch status {
//            case .finished: break
//            case .failure(let error): print(error)
//            }
//        } receiveValue: { value in
//            <#code#>
//        }.store(in: &cancellabels)
//    }
    
    private func settingSearchController() {
        searchController.searchBar.setValue("취소", forKey: "cancelButtonText")
        searchController.searchBar.placeholder = "게임, 앱, 스토리 등"
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = true
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.titleView = titleView
    }
}

extension FeatureSearchViewController {
    
    private var searchClickedValuePublisher: AnyPublisher<String, Never> {
        return Publishers
            .Zip(searchValueSubject, searchController.searchBar.searchButtonClickedPublisher)
            .map { term, _ in
                return term
            }
            .eraseToAnyPublisher()
    }
}

extension FeatureSearchViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let history = UserDefaults.standard.array(forKey: UserDefaultsKeys.searchHistory.rawValue)
        return history?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let history = UserDefaults.standard.array(forKey: UserDefaultsKeys.searchHistory.rawValue) as? [String] ?? [String]().reversed()

        // Configure content.
        content.attributedText = NSAttributedString(
            string: history[indexPath.row],
            attributes: [.font: indexPath.row == 0 ? AppStoreFont.bold(ofSize: AppStoreSize.contentSize) : AppStoreFont.regular(ofSize: AppStoreSize.contentSize),
                         .foregroundColor: indexPath.row == 0 ? UIAsset.fontBlack.color : UIAsset.mainBlue.color
            ]
        )
        content.textProperties.numberOfLines = 1
        content.textProperties.lineBreakMode = .byTruncatingTail
        
        cell.contentConfiguration = content
        
        if indexPath.row == 0 || indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.width)
        } else {
            cell.separatorInset = UIEdgeInsets(top: 10, left: AppStoreSize.defaultPadding, bottom: 10, right: AppStoreSize.defaultPadding)
        }
        
        return cell
    }
}
