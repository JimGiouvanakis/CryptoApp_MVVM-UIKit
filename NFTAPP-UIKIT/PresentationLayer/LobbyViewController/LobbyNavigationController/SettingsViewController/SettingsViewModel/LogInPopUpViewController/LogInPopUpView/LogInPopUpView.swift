//
//  LogInPopUpView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/11/24.
//

import Foundation
import UIKit

protocol LogInPopUpViewProtocol: AnyObject {
    func singIn(email: String, password: String)
}


class LogInPopUpView: UIView {
    
    @IBOutlet var customvView: UIView! {
        didSet {
            self.customvView.backgroundColor = .purple
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            self.titleLabel.text = "Sing in to your account to verify User"
            self.titleLabel.font = .preferredFont(forTextStyle: .title2)
            self.titleLabel.textColor = .black
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
    
    @IBOutlet weak var singInButton: UIButton! {
        didSet {
            self.singInButton.tintColor = .black
            self.singInButton.setTitle("Sing In", for: .normal)
            self.singInButton.setTitleColor(.purple, for: .normal)
        }
    }
    
    weak var delegate: LogInPopUpViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    func configureView() {
        guard let view = self.loadViewFromNib(nibName: "LogInPopUpView") else { return }
        view.frame = self.bounds
        view.backgroundColor = .purple
        view.layer.cornerRadius = 10.0
        self.addSubview(view)
    }
    
    @IBAction func singInButtonTaped(_ sender: UIButton) {
        guard  let email = emailTextField.text, let pass = passwordTextField.text else { return }
        
        self.delegate?.singIn(email: email, password: pass)
    }
}
