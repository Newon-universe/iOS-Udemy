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
import UI
import Utils

#if DEBUG
let sampleHistory = ["최근 검색어", "버스시간표", "포토샵", "쇼핑", "일본 지하철"]
let sampleSearchRelated = ["카카오뱅크", "카카오페이", "카카오페이지"]
#endif

public class FeatureSearchViewController: UIViewController {
    private var cancellabels = Set<AnyCancellable>()
    private var resultViewModel = FeatureSearchResultViewModel(searchResults: [])
    
    private lazy var resultController = FeatureSearchResultViewController(navigationController: navigationController, viewModel: resultViewModel)
    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: resultController)
        
        controller.searchBar.textDidChangePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.resultController.reloadHistorySnapshot()
            }
            .store(in: &cancellabels)
        
        controller.searchBar.searchButtonClickedPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                if let value = controller.searchBar.text {
                    self?.resultViewModel.histories += [value]
                }
                
                self?.resultController.reloadResultSnapshot()
            }
            .store(in: &self.cancellabels)
        
        controller.searchBar.cancelButtonClickedPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &self.cancellabels)
        
        return controller
    }()
    
    private let titleLabel: UILabel = UILabelFactory.build(text: "검색", font: AppStoreFont.bold(ofSize: AppStoreSize.titleSize))
    private lazy var profileIcon: UIButton = {
        let button = UIButtonFactory.build(image: UIImage(systemName: "person.crop.circle"))
        
        button.tapPublisher.sink { _ in
            print("ProfileButton Clicked")
        }
        .store(in: &self.cancellabels)

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
            .sink { tableView.deselectRow(at: $0, animated: true) }
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
        
        resultViewModel.requestResponse()
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

        cell.contentConfiguration = content
        
        if indexPath.row == 0 || indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.width)
        }
        
        return cell
    }
}
