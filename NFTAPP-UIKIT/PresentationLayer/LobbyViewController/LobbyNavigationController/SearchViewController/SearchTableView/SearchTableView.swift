//
//  SearchTableView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 20/11/24.
//

import Foundation
import UIKit

class SearchTableView: UITableView {
    
    var data: [NFT]? {
        didSet {
            self.reloadData()
        }
    }
    
    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = .black
        self.register(UINib(nibName: "FavListTableViewCell", bundle: nil), forCellReuseIdentifier: "FavListTableViewCellIdentifier")
    }
}
