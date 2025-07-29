//
//  BaseCollectionView+DataSource.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/10/24.
//

import Foundation
import UIKit

extension BaseCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let nft = data[indexPath.item]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellIdentifier", for: indexPath) as? CollectionViewCell {
            cell.setUp(model: nft)
            return cell
        }
        return UICollectionViewCell()
    }
}

