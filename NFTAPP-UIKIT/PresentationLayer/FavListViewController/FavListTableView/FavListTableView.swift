//
//  FavListTableView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 5/11/24.
//

import Foundation
import UIKit

class FavListTableView: UITableView {
    
    var data: [NFT] = []
    
    override func awakeFromNib() {
        self.backgroundColor = .black
        self.dataSource = self
        self.delegate = self
        self.register(UINib(nibName: "FavListTableViewCell", bundle: nil), forCellReuseIdentifier: "FavListTableViewCellIdentifier")
    }
}
