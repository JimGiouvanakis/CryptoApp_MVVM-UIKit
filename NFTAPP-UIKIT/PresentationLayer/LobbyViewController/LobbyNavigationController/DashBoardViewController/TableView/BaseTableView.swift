//
//  BaseTableView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 23/10/24.
//

import Foundation
import UIKit

protocol BaseTableViewProtocol: AnyObject {
    func didTapMoreDetails(model: NFT?)
    func didTapFavButton(model: NFT?)
    func topSearchItemTapped(model: NFT?)
}

class BaseTableView: UITableView {
    
    var data: [TableViewData]? {
        didSet {
            self.reloadData()
        }
    }
    
    weak var baseTableViewDelegate: BaseTableViewProtocol?
    
    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
        self.register(UINib(nibName: "NewSearchCell", bundle: nil), forCellReuseIdentifier: "NewSearchCellIdentifier")
        self.register(UINib(nibName: "TopSearchCell", bundle: nil), forCellReuseIdentifier: "TopSearchCellIdentifier")
        self.register(UINib(nibName: "MainSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "MainSearchTableViewCellIdentifier")
    }
}

enum TableViewData {
    case newSearch([NFT])
    case topSearch([NFT])
    case nfts([NFT])
}

extension BaseTableView: MainSearchTableViewCellProtocol {
    func didTapMoreDetails(model: NFT?) {
        self.baseTableViewDelegate?.didTapMoreDetails(model: model)
    }
    
    func didTapFavButton(model: NFT?) {
        self.baseTableViewDelegate?.didTapFavButton(model: model)
    }
}

extension BaseTableView: TopSearchCellProtocol {
    func topSearchItemTapped(model: NFT) {
        self.baseTableViewDelegate?.topSearchItemTapped(model: model)
    }
}
