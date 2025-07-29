//
//  FavListViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 5/11/24.
//

import Foundation
import UIKit


class FavListViewController: UIViewController {
    
    var model: [NFT] = []
    
    @IBOutlet weak var stackView: UIStackView!{
        didSet {
            self.stackView.backgroundColor = .black
        }
    }
    
    @IBOutlet weak var favListTableView: FavListTableView! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpFavListTableView(nfts: model)
    }
    
    func setUpFavListTableView(nfts: [NFT]) {
        self.favListTableView.data = nfts
        self.view.backgroundColor = .black
    }
}
