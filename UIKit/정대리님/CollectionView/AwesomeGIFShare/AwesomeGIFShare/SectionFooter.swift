//
//  SectionFooter.swift
//  AwesomeGIFShare
//
//  Created by Kim Yewon on 2023/10/04.
//

import UIKit

class SectionFooter: UICollectionReusableView {
    override class func awakeFromNib() {
        super.awakeFromNib()
        print(#fileID, #function, #line, "- ")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print(#fileID, #function, #line, "- ")
    }
}
