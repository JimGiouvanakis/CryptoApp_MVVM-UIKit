//
//  FavListEmptyViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 28/11/24.
//

import Foundation
import UIKit

class FavListEmptyViewController: UIViewController {
    
    @IBOutlet var customView: UIView!{
        didSet {
            self.customView.backgroundColor = .black
        }
    }
    
    @IBOutlet weak var favListEmpyView: FavListEmptyView! {
        didSet {
            self.favListEmpyView.customView.layer.cornerRadius = 10.0
            self.favListEmpyView.backgroundColor = .clear
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
