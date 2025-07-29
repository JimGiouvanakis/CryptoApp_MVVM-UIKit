//
//  PasswordChangePopUpView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/11/24.
//

import Foundation
import UIKit

protocol PasswordChangePopUpViewProtocol : AnyObject {
    func okButtonTapped(password: String)
}

class PasswordChangePopUpView: UIView {
    
    @IBOutlet var customView: UIView! {
        didSet{
            self.customView.backgroundColor = .purple
        }
    }
    
    @IBOutlet weak var titlteLabel: UILabel! {
        didSet {
            self.titlteLabel.text = "Insert your new Password"
            self.titlteLabel.textColor = .black
            self.titlteLabel.font = .preferredFont(forTextStyle: .title2)
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
            didSet {
                self.passwordTextField.backgroundColor = .black
                self.passwordTextField.textColor = .purple
                self.passwordTextField.attributedPlaceholder = NSAttributedString (
                    string: "Password",
                    attributes: [
                        .foregroundColor: UIColor.purple
                    ]
                )
                self.passwordTextField.layer.borderColor = UIColor.purple.cgColor
                self.passwordTextField.layer.borderWidth = 1.0
                self.passwordTextField.layer.cornerRadius = 5.0
                self.passwordTextField.tintColor = .purple
                self.passwordTextField.isSecureTextEntry = true
            }
        }
    
    @IBOutlet weak var okButton: UIButton! {
        didSet {
            self.okButton.tintColor = .black
            self.okButton.setTitle("Change Password", for: .normal)
            self.okButton.setTitleColor(.purple, for: .normal)
        }
    }
    
    weak var delegate: PasswordChangePopUpViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    func configureView() {
        guard let view = self.loadViewFromNib(nibName: "PasswordChangePopUpView") else { return }
        view.frame = self.bounds
        view.backgroundColor = .purple
        view.layer.cornerRadius = 10.0
        self.addSubview(view)
    }
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        guard let password = passwordTextField.text else { return }
        self.delegate?.okButtonTapped(password: password)
    }
    
}
