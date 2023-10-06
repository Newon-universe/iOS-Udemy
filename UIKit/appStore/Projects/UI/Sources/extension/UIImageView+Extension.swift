//
//  UIImageView.swift
//  UI
//
//  Created by Kim Yewon on 2023/09/28.
//  Copyright © 2023 labo.summer. All rights reserved.
//

import UIKit

extension UIImageView {
    public func load(url: String) {
        guard let url = URL(string: url) else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

