//
//  NewSearchCollectionView+FlowLayout.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 7/11/24.
//

import Foundation
import UIKit


extension NewSearchCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

class NewSearchCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    // MARK: - Properties
    
    var cellSize: CGSize = CGSize(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.height * 0.2)
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.scrollDirection = .horizontal
        self.collectionView?.decelerationRate = .fast
        self.itemSize = cellSize
    }
}
