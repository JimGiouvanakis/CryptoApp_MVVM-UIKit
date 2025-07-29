//
//  BaseCollectionViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/10/24.
//

import Foundation
import UIKit

protocol BaseCollectionViewProtocol: AnyObject {
    func topSearchItemTapped(model: NFT)
}


class BaseCollectionView: UICollectionView {
    
    weak var baseCollectionViewdelegate: BaseCollectionViewProtocol?
    
    var data: [NFT] = []
    
    let viewController = LobbyViewController()
    
    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
        self.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCellIdentifier")
    }
}
