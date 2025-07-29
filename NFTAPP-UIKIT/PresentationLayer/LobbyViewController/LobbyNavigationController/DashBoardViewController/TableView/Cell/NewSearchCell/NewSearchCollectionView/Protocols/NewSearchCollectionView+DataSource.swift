//
//  NewSearchCollectionView+DataSource.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 6/11/24.
//

import Foundation
import UIKit

extension NewSearchCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let nft = data[indexPath.item]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewSearchCollectionViewCellIdentifier", for: indexPath) as? NewSearchCollectionViewCell {
            cell.numberOfItems = data.count
            cell.pages.currentPage = pageCounter
            if pageCounter <= data.count {
                pageCounter += 1
            } else {
                pageCounter = 1
            }
            cell.setUp(model: nft)
            return cell
        }
        
        return UICollectionViewCell()
    }
}
