//
//  MoreDetailsViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 30/10/24.
//

import Foundation
import UIKit

class MoreDetailsViewController: UIViewController {
    
    var model: NFT?
    
    @IBOutlet weak var moreDetailsTableView: MoreDetailsTableView! {
        didSet {
            self.moreDetailsTableView.backgroundColor = .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.setUpMoreDetailsTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .purple
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setUpMoreDetailsTableView() {
        self.moreDetailsTableView.data = model
    }
}


