//
//  FeatureSearchDetailViewController.swift
//  FeatureSearch
//
//  Created by Kim Yewon on 2023/09/20.
//  Copyright © 2023 labo.summer. All rights reserved.
//

import UIKit
import Combine
import CombineCocoa
import SnapKit
import Core
import UI

public class FeatureSearchDetailViewController: UIViewController {

    private var cancellabels = Set<AnyCancellable>()
    private var screenShotCollectionView: UICollectionView!
    private var screenShotDataSource: UICollectionViewDiffableDataSource<ScreenshotEnum, AppScreenShot>!
    
    private var viewModel: FeatureSearchDetailViewModel
    
    
    let logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIAsset.backgroundGray.color
        imageView.addCornerRadius(radius: 12)
        return imageView
    }()
    
    private var titleLabel = UILabelFactory.build(text: "", font: AppStoreFont.regular(ofSize: AppStoreSize.contentSize))
    private var subTitleLabel = UILabelFactory.build(text: "", font: AppStoreFont.regular(ofSize: AppStoreSize.captionSize), textColor: UIAsset.fontGray.color, maximumLines: 2)
    lazy var labelContainer: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [titleLabel, subTitleLabel]
        )
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        let title = NSAttributedString(
            string: "받기",
            attributes: [
                .font: AppStoreFont.bold(ofSize: AppStoreSize.captionSize),
                .foregroundColor: UIAsset.white.color
            ]
        )
        
        button.setAttributedTitle(
            title,
            for: .normal
        )
        
        button.tintColor = UIAsset.mainBlue.color
        button.backgroundColor = UIAsset.mainBlue.color
        button.addCornerRadius(radius: 13)
        
        button.tapPublisher
            .sink { _ in
                print("Search-Download button clicked")
            }
            .store(in: &self.cancellabels)
        
        return button
    }()
    
    private lazy var ellipsisButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "ellipsis")
        
        button.setImage(image, for: .normal)
        button.tintColor = UIAsset.white.color
        button.backgroundColor = UIAsset.mainBlue.color
        button.addCornerRadius(radius: 11)
        
        button.tapPublisher
            .sink { _ in
                print("ellipsis button clicked")
            }
            .store(in: &self.cancellabels)
        
        return button
    }()
    
    private lazy var ratingView = UIStackView()
    private lazy var categoryView: UIStackView = {
        let rankLabel = UILabelFactory.build(text: "#4", font: AppStoreFont.demibold(ofSize: AppStoreSize.contentSize))
        rankLabel.textColor = UIAsset.fontGray.color

        let categoryLabel = UILabelFactory.build(text: "금융", font: AppStoreFont.regular(ofSize: AppStoreSize.captionSize - 2))
        categoryLabel.textColor = UIAsset.fontGray.color
        
        let container = UIStackView(
            arrangedSubviews: [rankLabel, categoryLabel]
        )
        container.axis = .vertical
        container.alignment = .leading
        container.spacing = 5
        return container
    }()
    
    private lazy var ageView: UIStackView = {
        let ageLabel = UILabelFactory.build(text: "4+", font: AppStoreFont.demibold(ofSize: AppStoreSize.contentSize))
        ageLabel.textColor = UIAsset.fontGray.color

        let categoryLabel = UILabelFactory.build(text: "연령", font: AppStoreFont.regular(ofSize: AppStoreSize.captionSize - 2))
        categoryLabel.textColor = UIAsset.fontGray.color
        
        let container = UIStackView(
            arrangedSubviews: [ageLabel, categoryLabel]
        )
        container.axis = .vertical
        container.alignment = .leading
        container.spacing = 5
        return container
    }()
    
    private lazy var editionalView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [ratingView, categoryView, ageView]
        )
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    init(viewModel: FeatureSearchDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        setupScreenShotCollectionViewController()
        setupScreenShotDataSource()
        layout()
        reloadScreenShotDataSource()
    }
    
    func layout(){
        view.backgroundColor = UIAsset.white.color
        
        [logoView, labelContainer, downloadButton, ellipsisButton, editionalView, screenShotCollectionView].forEach {
            view.addSubview($0)
        }
        
        logoView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(AppStoreSize.defaultPadding)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(AppStoreSize.largeImageSize)
            make.width.equalTo(AppStoreSize.largeImageSize)
        }
        
        labelContainer.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(logoView.snp.trailing).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-AppStoreSize.defaultPadding)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.bottom.equalTo(logoView.snp.bottom)
            make.leading.equalTo(logoView.snp.trailing).offset(10)
            make.height.equalTo(AppStoreSize.captionSize + 10)
            make.width.equalTo(AppStoreSize.captionSize + 55)
        }
        
        ellipsisButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-AppStoreSize.defaultPadding)
            make.bottom.equalTo(logoView.snp.bottom)
            make.height.equalTo(AppStoreSize.contentSize + 5)
            make.width.equalTo(AppStoreSize.contentSize + 5)
        }
        
        editionalView.snp.makeConstraints { make in
            make.top.equalTo(logoView.snp.bottom).offset(AppStoreSize.defaultPadding)
            make.leading.equalTo(logoView.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-AppStoreSize.defaultPadding)
        }
        
        screenShotCollectionView.snp.makeConstraints { make in
            make.top.equalTo(editionalView.snp.bottom)
            make.leading.equalTo(logoView.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-AppStoreSize.defaultPadding)
            make.bottom.equalToSuperview()
        }
    }
    
    func configure(item: iTuensModel) {
        titleLabel.attributedText = NSAttributedString(
            string: viewModel.item.trackName ?? "",
            attributes: [
                .font: AppStoreFont.regular(ofSize: AppStoreSize.contentSize),
                .foregroundColor: UIAsset.fontBlack.color
            ]
        )
        
        subTitleLabel.attributedText = NSAttributedString(
            string: viewModel.item.description ?? "",
            attributes: [
                .font: AppStoreFont.regular(ofSize: AppStoreSize.captionSize),
                .foregroundColor: UIAsset.fontSemiBlack.color
            ]
        )
        
        logoView.load(url: viewModel.item.artworkUrl512 ?? "") {
            
        }
        
        ratingView.arrangedSubviews.forEach {
            ratingView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        ratingView.configure(rating: viewModel.item.averageUserRating ?? 0, count: Int64(item.userRatingCount ?? 0))
    }
}


extension FeatureSearchDetailViewController {
    static func setupScreenShotCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let itemWidth = UIScreen.main.bounds.width * 0.3
        let itemHeight = UIScreen.main.bounds.height * 0.7
        let itemSpacing: CGFloat = AppStoreSize.defaultPadding
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumInteritemSpacing = itemSpacing
        layout.scrollDirection = .horizontal
        
        return layout
    }
    
    func setupScreenShotCollectionViewController() {
        screenShotCollectionView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: SearchCollectionResultCell.setupScreenShotCollectionViewFlowLayout())
                
        screenShotCollectionView.register(
            ScreenDetailShotCell.self,
              forCellWithReuseIdentifier: ScreenDetailShotCell.identifier
        )
    }
    
    func setupScreenShotDataSource() {
        screenShotDataSource = .init(collectionView: screenShotCollectionView, cellProvider: { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ScreenDetailShotCell.identifier,
                for: indexPath
            ) as! ScreenDetailShotCell
            
            cell.configure(item: item)
            return cell
        })
        
        self.screenShotCollectionView.dataSource = self.screenShotDataSource
    }
    
    func reloadScreenShotDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<ScreenshotEnum, AppScreenShot>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.screenShots, toSection: .main)
        screenShotDataSource.apply(snapshot, animatingDifferences: false)
    }
}

