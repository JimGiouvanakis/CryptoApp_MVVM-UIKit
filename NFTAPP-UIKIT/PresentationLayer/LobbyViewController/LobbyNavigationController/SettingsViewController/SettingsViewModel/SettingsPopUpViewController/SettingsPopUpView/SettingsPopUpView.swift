//
//  SettingsPopUpView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 22/11/24.
//

import Foundation
import UIKit

protocol SettingsPopUpViewProtocol: AnyObject {
    func okButtonTapped(email: String)
}

class SettingsPopUpView: UIView {
    
    @IBOutlet weak var customImageView: UIImageView! {
        didSet {
            self.customImageView.image = UIImage(named: "UserIcon")
        }
    }
    
    @IBOutlet weak var title1Label: UILabel! {
        didSet {
            self.title1Label.text = "Change your Email"
            self.title1Label.font = .preferredFont(forTextStyle: .title2)
        }
    }
    
    @IBOutlet weak var title2Label: UILabel! {
        didSet {
            self.title2Label.text = "Insert your new Email Address"
            self.title2Label.font = .preferredFont(forTextStyle: .title3)
        }
    }
    
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            self.emailTextField.backgroundColor = .black
            self.emailTextField.textColor = .purple
            self.emailTextField.attributedPlaceholder = NSAttributedString (
                string: "Email Address",
                attributes: [
                    .foregroundColor: UIColor.purple
                ]
            )
            self.emailTextField.layer.borderColor = UIColor.purple.cgColor
            self.emailTextField.layer.borderWidth = 1.0
            self.emailTextField.layer.cornerRadius = 5.0
            self.emailTextField.tintColor = .purple
        }
    }

    
    @IBOutlet weak var okButton: UIButton! {
        didSet {
            self.okButton.tintColor = .black
            self.okButton.setTitle("Send", for: .normal)
            self.okButton.setTitleColor(.purple, for: .normal)
        }
    }
    
    weak var delegate: SettingsPopUpViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    func configureView() {
        guard let view = self.loadViewFromNib(nibName: "SettingsPopUpView") else { return }
        view.frame = self.bounds
        view.backgroundColor = .purple
        view.layer.cornerRadius = 10.0
        self.addSubview(view)
    }
    
        @IBAction func okButtonTapped(_ sender: UIButton) {
            guard let email = emailTextField.text else { return }
                self.delegate?.okButtonTapped(email: email)
        }
    
}
