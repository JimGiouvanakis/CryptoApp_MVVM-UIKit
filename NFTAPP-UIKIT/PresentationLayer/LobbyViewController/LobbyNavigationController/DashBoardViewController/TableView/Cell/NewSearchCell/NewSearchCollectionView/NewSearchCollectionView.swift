//
//  NewSearchCollectionView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 6/11/24.
//

import Foundation
import UIKit

class NewSearchCollectionView: UICollectionView {
    
    var data: [NFT] = []
    
    var pageCounter: Int = 0
    
    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
        self.register(UINib(nibName: "NewSearchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewSearchCollectionViewCellIdentifier")
    }
}
