//
//  ConfirmPopUpViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/11/24.
//

import Foundation
import UIKit

class ConfirmPopUpViewController: UIViewController {
    
    var text: String = ""
    
    @IBOutlet var customView: UIView! {
        didSet {
            self.customView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var confirmView: ConfirmPopUpView! {
        didSet {
            self.confirmView.backgroundColor = .clear
            self.confirmView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewLabel(text: text)
    }
    
    func setUpViewLabel(text: String) {
        self.confirmView.setUpViewLabel(text: text)
    }
}

extension ConfirmPopUpViewController: ConfirmPopUpViewProtocol {
    func okButtonTapped() {
        self.dismiss(animated: true)
    }
}
