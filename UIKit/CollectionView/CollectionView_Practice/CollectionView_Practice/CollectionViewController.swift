//
//  ViewController.swift
//  CollectionView_Practice
//
//  Created by Kim Yewon on 2023/08/01.
//

import UIKit
import Combine

class CollectionViewController: UICollectionViewController {

    private var dataSource: UICollectionViewDiffableDataSource<Section, Product>!
    
    enum Section: Int, CaseIterable {
        case paging
        case grid
    }
    
    @Published private var products: [Product] = []
    @Published private var pets: [Product] = []
    
    private var cancellabels = Set<AnyCancellable>()
    private var isPaginating = false
    
    init() {
        super.init(collectionViewLayout: CollectionViewController.setupCompositionalLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchProducts()
        fetchPets()
        observe()
        setupDataSource()
        setupCollectionViewController()
    }
    
    func setupDataSource() {
        dataSource = .init(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let section = Section(rawValue: indexPath.section) else { return UICollectionViewCell() }
            
            switch section {
            case .paging:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ProductCell.pagingIdentifier,
                    for: indexPath
                ) as! ProductCell
                
                cell.configure(item: item)
                return cell
                
            case .grid:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ProductCell.gridIdentifier,
                    for: indexPath
                ) as! ProductCell
                
                cell.configure(item: item)
                return cell
            }
        })
    }
    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
    
    static func setupCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(){ sectionIndex, env in
            guard let section = Section(rawValue: sectionIndex) else { return nil }
            
            switch section {
            case .paging:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(0.5),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                item.contentInsets = .init(top: 4, leading: 4, bottom: 4, trailing: 4)
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(0.5)
                    ),
                    subitems: [item]
                )
                group.contentInsets = .init(top: 4, leading: 4, bottom: 4, trailing: 4)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
                
            case .grid:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(0.25),
                        heightDimension: .absolute(150)
                    )
                )
                item.contentInsets = .init(top: 4, leading: 4, bottom: 4, trailing: 4)
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(100)
                    ),
                    subitems: [item]
                )
//                group.contentInsets = .init(top: 4, leading: 4, bottom: 4, trailing: 4)
                
                let section = NSCollectionLayoutSection(group: group)
                let footerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(44)
                )
                
                let footer = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: "hahaha",
                    alignment: .bottom
                )
                section.boundarySupplementaryItems = [footer]
                
//                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
            }
        }
        
        return layout
    }
    
    static let categoryHeaderId = "categoryHeaderId"
    
    func setupCollectionViewController() {
        
        collectionView.register(
              UICollectionViewCell.self,
              forCellWithReuseIdentifier: "cellId"
        )
        collectionView.register(
              ProductCell.self,
              forCellWithReuseIdentifier: ProductCell.pagingIdentifier
        )
        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: "hahaha",
            withReuseIdentifier: "hahaha"
        )
        collectionView.register(
              ProductCell.self,
              forCellWithReuseIdentifier: ProductCell.gridIdentifier
        )
    }
    
    func observe() {
        $products
            .filter { !$0.isEmpty }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] products in
                self?.reloadSnapshot()
            }
            .store(in: &cancellabels)
        
        $pets
            .filter { !$0.isEmpty }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] pets in
                self?.reloadSnapshot()
            }
            .store(in: &cancellabels)
    }

    
    func fetchProducts(completion: (()-> Void)? = nil) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [unowned self] in
            let currentCount = products.count
            var newItems = [Product]()
            
            for i in 1 ..< 11 {
                let newCount = currentCount + i
                let item = Product(
                    name: "Product \(newCount)",
                    imageURL: "https://source.unsplash.com/random/?product&\(newCount)"
                )
                newItems.append(item)
            }
            products.append(contentsOf: newItems)
            completion?()
        }
    }
    
    func fetchPets(completion: (()-> Void)? = nil) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [unowned self] in
            let currentCount = pets.count
            var newItems = [Product]()
            
            for i in 1 ..< 11 {
                let newCount = currentCount + i
                let item = Product(
                    name: "Product \(newCount)",
                    imageURL: "https://source.unsplash.com/random/?pet&\(newCount)"
                )
                newItems.append(item)
            }
            pets.append(contentsOf: newItems)
            completion?()
        }
    }
    
    func reloadSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Product>()
        snapshot.appendSections([.paging, .grid])
        snapshot.appendItems(products, toSection: .paging)
        snapshot.appendItems(pets, toSection: .grid)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

