//
//  BaseCollectionView+Delegate.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/10/24.
//

import Foundation
import UIKit

extension BaseCollectionView: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.baseCollectionViewdelegate?.topSearchItemTapped(model: data[indexPath.item])
        print(data[indexPath.item].name)
    }
}
