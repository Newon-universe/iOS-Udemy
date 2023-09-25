//
//  FeatureSearchResultViewController.swift
//  FeatureSearch
//
//  Created by Kim Yewon on 2023/09/20.
//  Copyright © 2023 labo.summer. All rights reserved.
//

import UIKit
import Combine
import CombineCocoa
import Core
import UI
import Utils


public class FeatureSearchResultViewController: UICollectionViewController {
    private weak var featureNavigaionController: UINavigationController?
    private var viewModel: FeatureSearchResultViewModel
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, SearchResult>!
    
    public enum Section: Int, CaseIterable {
        case history
        case result
    }
    
    private var cancellabels = Set<AnyCancellable>()
    private var isPaginating = false
    
    init(navigationController: UINavigationController?, viewModel: FeatureSearchResultViewModel) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: FeatureSearchResultViewController.setupCompositionalLayout())
        self.featureNavigaionController = navigationController
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionViewController()
        setupDataSource()
    }
    
    func reloadHistorySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, SearchResult>()
        snapshot.appendSections([.history, .result])
        snapshot.appendItems(viewModel.histories.compactMap { SearchResult(title: $0) }.tail, toSection: .history)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func reloadResultSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, SearchResult>()
        snapshot.appendSections([.history, .result])
        snapshot.appendItems(viewModel.searchResults, toSection: .result)
        dataSource.apply(snapshot,animatingDifferences: false)
    }
}


//MARK: - CollectionView Setup functions
extension FeatureSearchResultViewController {
    
    func setupCollectionViewController() {
        collectionView.register(
            SearchCollectionHistoryCell.self,
              forCellWithReuseIdentifier: SearchCollectionHistoryCell.identifier
        )
        
        collectionView.register(
              SearchCollectionResultCell.self,
              forCellWithReuseIdentifier: SearchCollectionResultCell.identifier
        )
    }
    
    func setupDataSource() {
        dataSource = .init(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let section = Section(rawValue: indexPath.section) else { return UICollectionViewCell() }
            
            switch section {
            case .history:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: SearchCollectionHistoryCell.identifier,
                    for: indexPath
                ) as! SearchCollectionHistoryCell

                
                cell.configure(item: item)
                return cell
                
            case .result:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: SearchCollectionResultCell.identifier,
                    for: indexPath
                ) as! SearchCollectionResultCell
                
                cell.configure(item: item)
                return cell
            }
        })
        
        self.collectionView.dataSource = self.dataSource
    }
    
    static func setupCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout() { sectionIndex, env in
            guard let section = Section(rawValue: sectionIndex) else { return nil }
            
            switch section {
            case .history:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(AppStoreSize.titleSize)
                    )
                )
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(AppStoreSize.titleSize + AppStoreSize.defaultPadding * 2)
                    ),
                    subitems: [item]
                )
                group.contentInsets = .init(top: AppStoreSize.defaultPadding, leading: AppStoreSize.defaultPadding, bottom: 5, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                
                return section
                
            case .result:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(0.43)
                    ),
                    subitems: [item]
                )
                group.contentInsets = .init(top: AppStoreSize.defaultPadding * 0.5, leading: AppStoreSize.defaultPadding, bottom: 5, trailing: AppStoreSize.defaultPadding)
                
                let section = NSCollectionLayoutSection(group: group)
                return section
            }
        }
        
        return layout
    }
    
    public override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }

    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }

        switch section {
        case .history: return viewModel.histories.count
        case .result: return viewModel.searchResults.count
        }
    }
    
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = FeatureSearchDetailViewController()
        let item = SearchResult(title: "카카오뱅크", subTitle: "이미 모두의 은행")
        detailViewController.configure(item: item)
        
        self.featureNavigaionController?.pushViewController(detailViewController, animated: true)
    }
}
