//
//  PasswordChangePopUpViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/11/24.
//

import Foundation
import UIKit

protocol PasswordChangePopUpViewControllerProtocol: AnyObject {
    func okButtonTapped(password: String)
}

class PasswordChangePopUpViewController: UIViewController {
    
    @IBOutlet var customView: UIView! {
        didSet {
            self.customView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var popUpView: PasswordChangePopUpView! {
        didSet {
            self.popUpView.backgroundColor = .clear
            self.popUpView.delegate = self
        }
    }
    
    weak var passwordChangeDelegate: PasswordChangePopUpViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
    }
}

extension PasswordChangePopUpViewController: PasswordChangePopUpViewProtocol {
    func okButtonTapped(password: String) {
        self.passwordChangeDelegate?.okButtonTapped(password: password)
        
        self.dismiss(animated: true)
        
        
        
    }
}
