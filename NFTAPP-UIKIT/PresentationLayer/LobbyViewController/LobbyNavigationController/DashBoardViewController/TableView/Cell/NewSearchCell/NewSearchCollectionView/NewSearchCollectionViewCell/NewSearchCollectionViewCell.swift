//
//  NewSearchCollectionViewCell.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 6/11/24.
//

import Foundation
import UIKit

class NewSearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    
    var newSearchCell = NewSearchCell()
    
    @IBOutlet weak var pages: UIPageControl!
    
    var numberOfItems: Int = 0 {
        didSet {
            pages.numberOfPages = numberOfItems
        }
    }
    
    @IBOutlet weak var newTagLabel: UILabel! {
        didSet{
            self.newTagLabel.text = "NEW"
            self.newTagLabel.textColor = .black
            self.newTagLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
            self.newTagLabel.layer.cornerRadius = 10
            self.newTagLabel.layer.masksToBounds = true
            self.newTagLabel.backgroundColor = .yellow
            self.newTagLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 4.5)
        }
    }
    
    @IBOutlet weak var imageCustomView: UIImageView! {
        didSet {
            self.imageCustomView.layer.cornerRadius = 20.0
            self.imageCustomView.contentMode = .scaleAspectFit
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pages.currentPage = 0
    }
    
    func setUp(model: NFT) {
        if let url = URL(string: model.imageUrl) {
            imageCustomView.imageFrom(url: url)
        }
        self.view.backgroundColor = .black
    }
}
