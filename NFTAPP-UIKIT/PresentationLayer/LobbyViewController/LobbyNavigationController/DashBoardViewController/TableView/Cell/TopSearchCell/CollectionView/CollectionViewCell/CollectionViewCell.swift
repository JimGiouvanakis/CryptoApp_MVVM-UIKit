//
//  CollectionViewCell.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/10/24.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet{
            self.imageView.contentMode = .scaleAspectFill
            self.imageView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var collectionLabelView: UILabel! {
        didSet {
            self.collectionLabelView.textColor = .purple
            self.collectionLabelView.layer.cornerRadius = 20
            self.collectionLabelView.backgroundColor = .clear
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(model: NFT) {
        if let url = URL(string: model.imageUrl) {
            imageView.imageFrom(url: url)
        }
        self.collectionLabelView.text = model.name
        self.view.layer.cornerRadius = 20.0
        self.view.layer.borderWidth = 4.0
        self.view.layer.borderColor = UIColor.gray.cgColor
    }
}
