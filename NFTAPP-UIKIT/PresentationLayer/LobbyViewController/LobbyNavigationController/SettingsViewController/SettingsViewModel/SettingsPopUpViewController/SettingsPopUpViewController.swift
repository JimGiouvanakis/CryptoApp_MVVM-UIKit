//
//  SettingsPopUpViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 22/11/24.
//

import Foundation
import UIKit

protocol SettingsPopUpViewControllerProtocol: AnyObject {
    func changeEmail(email: String)
}

class SettingsPopUpViewController: UIViewController {
    
    @IBOutlet var customView: UIView! {
        didSet {
            self.customView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var settingPopUpView: SettingsPopUpView! {
        didSet {
            self.settingPopUpView.backgroundColor = .clear
            self.settingPopUpView.delegate = self
        }
    }
    
    weak var settingsPopUpdelegage: SettingsPopUpViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
    }
}

extension SettingsPopUpViewController: SettingsPopUpViewProtocol {
    func okButtonTapped(email: String) {
        self.settingsPopUpdelegage?.changeEmail(email: email)
    }
}
