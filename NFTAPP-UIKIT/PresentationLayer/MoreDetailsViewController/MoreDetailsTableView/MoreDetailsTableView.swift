//
//  MoreDetailsTableView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 4/11/24.
//

import Foundation
import UIKit

class MoreDetailsTableView: UITableView {
    
    var data: NFT?
    
    override func awakeFromNib() {
        self.backgroundColor = .black
        self.dataSource = self
        self.delegate = self
        self.register(UINib(nibName: "MoreDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "MoreDetailsTableViewCellIdentifier")
    }
}
