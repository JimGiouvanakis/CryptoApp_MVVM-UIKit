//
//  TopSearchCell.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/10/24.
//

import Foundation
import UIKit

protocol TopSearchCellProtocol: AnyObject {
    func topSearchItemTapped(model: NFT)
}

class TopSearchCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: BaseCollectionView! {
        didSet {
            self.collectionView.backgroundColor = .clear
            self.collectionView.baseCollectionViewdelegate = self
        }
    }
    
    weak var delegate: TopSearchCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    
    func setUp(model: [NFT], delegate: TopSearchCellProtocol ) {
        self.collectionView.data = model
        self.delegate = delegate
    }
    
    func calculateCollectionViewHeight() -> CGFloat {
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        let itemSize = CGSize(width: 100, height: 100) 
        let itemsPerRow = Int(collectionView.frame.width / itemSize.width)
        let rows = (numberOfItems + itemsPerRow - 1) / itemsPerRow
        return CGFloat(rows) * itemSize.height
    }
}

extension TopSearchCell: BaseCollectionViewProtocol {
    func topSearchItemTapped(model: NFT) {
        self.delegate?.topSearchItemTapped(model: model)
    }
}
