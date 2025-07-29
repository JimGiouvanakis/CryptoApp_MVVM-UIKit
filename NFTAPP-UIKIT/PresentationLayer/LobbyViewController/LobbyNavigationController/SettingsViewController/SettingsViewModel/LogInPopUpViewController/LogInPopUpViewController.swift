//
//  LogInPopUpViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/11/24.
//

import Foundation
import UIKit

protocol LogInPopUpViewControllerProtocol: AnyObject {
    func singIn(email: String, password: String) async -> Bool?
}

class LogInPopUpViewController: UIViewController {
    
    @IBOutlet var customView: UIView! {
        didSet {
            self.customView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var logiInPopUpView: LogInPopUpView! {
        didSet {
            self.logiInPopUpView.backgroundColor = .clear
            self.logiInPopUpView.delegate = self
        }
    }
    
    weak var logInPopUpDelegate: LogInPopUpViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
    }
}

extension LogInPopUpViewController: LogInPopUpViewProtocol {
    func singIn(email: String, password: String) {
        var status: Bool?
        Task {
            status = await self.logInPopUpDelegate?.singIn(email: email, password: password)
            
            guard status == nil else {
                if status == true {
                    self.dismiss(animated: true)
                    
                } else if status == false {
                    
                    let storyboard = UIStoryboard(name: "AuthenticationErrorHandlingViewController", bundle: nil)
                    if let errorSheet = storyboard.instantiateViewController(withIdentifier: "AuthenticationErrorHandlingViewController") as? AuthenticationErrorHandlingViewController {
                        
                        let error = "Invalid Credential"
                        
                        errorSheet.text = error
                        
                        self.present(errorSheet, animated: true)
                    }
                }
                return
            }
        }
    }
}
