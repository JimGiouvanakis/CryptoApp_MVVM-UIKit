//
//  AuthenticationErrorHandlingViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 22/11/24.
//

import Foundation
import UIKit

class AuthenticationErrorHandlingViewController: UIViewController {
    
    var text: String = ""
    
    @IBOutlet var customView: UIView! {
        didSet {
            self.customView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var popUpView: PopUpView! {
        didSet {
            self.popUpView.delegate = self
            self.popUpView.backgroundColor = .clear
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPopUpText(text: text)
    }
    
    func setupPopUpText(text: String) {
        self.popUpView.setUpView(warningLabel1: text)
    }
    
}

extension AuthenticationErrorHandlingViewController: PopUpViewProtocol {
    func okButtonTapped() {
        self.dismiss(animated: true)
    }
}
