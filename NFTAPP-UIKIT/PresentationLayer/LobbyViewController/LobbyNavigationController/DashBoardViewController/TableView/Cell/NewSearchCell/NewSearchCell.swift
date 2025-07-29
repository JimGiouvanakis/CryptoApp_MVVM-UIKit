//
//  NewSearchCell.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 6/11/24.
//

import Foundation
import UIKit

class NewSearchCell: UITableViewCell {
    
    var timer: Timer?
    var currentIndex: Int = 0
    var items: [NFT] = []
    
    @IBOutlet weak var collectionView: NewSearchCollectionView! {
        didSet {
            self.collectionView.backgroundColor = .black
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    
    func setUp(model: [NFT]) {
        self.collectionView.data = model
        self.items = model
        self.autoScrollerTimer()
    }
    
    func calculateCollectionViewHeight() -> CGFloat {
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        let itemSize = CGSize(width: 100, height: 100)
        let itemsPerRow = Int(collectionView.frame.width / itemSize.width)
        let rows = (numberOfItems + itemsPerRow - 1) / itemsPerRow
        return CGFloat(rows) * itemSize.height
    }
    
    func autoScrollerTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(autoScroller), userInfo: nil, repeats: true)
    }
    
    @objc func autoScroller() {
        guard let collectionView = collectionView else { return }
        currentIndex = (currentIndex + 1) % items.count
        
        let indexPath = IndexPath(item: currentIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
