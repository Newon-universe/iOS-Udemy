//
//  GifCollectionViewCell.swift
//  AwesomeGIFShare
//
//  Created by Kim Yewon on 2023/10/04.
//

import UIKit
import SwiftyGif

/// 움짤 쎌
class GifCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#fileID, #function, #line, "- ")
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.black.withAlphaComponent(0.8).cgColor
        self.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print(#fileID, #function, #line, "- ")
        self.gifImageView.clear()
//        self.gifImageView.stopAnimatingGif()
    }
    
    
    func configureCell(cellData: URL) {
        let loader = UIActivityIndicatorView(style: .medium)
        gifImageView.setGifFromURL(cellData, customLoader: loader)
        self.gifImageView.startAnimatingGif()
    }
}
