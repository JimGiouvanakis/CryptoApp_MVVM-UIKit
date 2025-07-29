//
//  UIImageView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 22/10/24.
//

import UIKit

extension UIImageView {
    func imageFrom(url: URL) {
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
