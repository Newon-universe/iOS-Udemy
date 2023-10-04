//
//  ViewController.swift
//  AwesomeGIFShare
//
//  Created by Kim Yewon on 2023/10/04.
//

import UIKit
import SwiftyGif

class ViewController: UIViewController {
    
    @IBOutlet weak var gifCollectionView: UICollectionView!
    
    var gifList: [URL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gifCollectionView.dataSource = self
        gifCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        gifCollectionView.delegate = self
        
        fetchGiphyResponse()
    }
    
    
    func fetchGiphyResponse() {
        let url = URL(string: "https://api.giphy.com/v1/gifs/trending?api_key=K1nFx9tctnFGjoTvuDPT7loB9nDQwGdB")!
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self else { return }
            
            if let error = error {
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                return
            }
            
            guard let data: Data = data,
                  let giphyResponse: GiphyResponse = try? JSONDecoder().decode(GiphyResponse.self, from: data),
                  let giphyList: [Giphy] = giphyResponse.data
            else { return }
            
            let urlList: [URL] = giphyList.compactMap { $0.url }
            self.gifList = urlList
            
            DispatchQueue.main.async {
                self.gifCollectionView.reloadData()
            }
            
        }
        
        task.resume()
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = Int(collectionView.bounds.width)
        let height = 100
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let width = Int(collectionView.bounds.width)
        let height = 100
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width / 3) - 15
        let height = width
        
        return CGSize(width: width, height: height)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GifCollectionViewCell", for: indexPath) as? GifCollectionViewCell
        else { return UICollectionViewCell() }
        
        let cellData: URL = self.gifList[indexPath.item]
        cell.configureCell(cellData: cellData)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath)
            
            return headerView
            
        default:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "SectionFooter", for: indexPath)
            return footerView
        }
        
    }
}
