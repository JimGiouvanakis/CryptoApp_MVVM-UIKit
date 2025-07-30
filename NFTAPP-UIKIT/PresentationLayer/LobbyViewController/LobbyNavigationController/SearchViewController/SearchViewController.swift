//
//  SearchViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 18/11/24.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    var nfts: [NFT] = []
    
    var searchListNfts: [NFT] = [] {
        didSet {
            self.searchTableView.reloadData()
        }
    }
    
    @IBOutlet var customView: UIView!
    
    @IBOutlet weak var headerLabel: UILabel! {
        didSet {
            self.headerLabel.text = "Search"
            self.headerLabel.textColor = .purple
            self.headerLabel.font = .preferredFont(forTextStyle: .title1)
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            self.searchBar.barTintColor = .black
            self.searchBar.tintColor = .purple
            self.searchBar.searchTextField.textColor = .purple
            self.searchBar.delegate = self
        }
    }
    
    @IBOutlet weak var searchTableView: SearchTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setUpTable(nfts: searchListNfts)
    }
    
    func setUpTable(nfts: [NFT]) {
        self.searchTableView.data = nfts
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchListNfts = nfts.filter({$0.name.contains(searchText)})
        setUpTable(nfts: searchListNfts)
    }
}
