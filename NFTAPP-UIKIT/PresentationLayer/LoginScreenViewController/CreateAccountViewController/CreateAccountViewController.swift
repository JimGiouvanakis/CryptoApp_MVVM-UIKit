//
//  CreateAccountViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 20/11/24.
//

import Foundation
import UIKit

class CreateAccountViewController : UIViewController {
    
    var viewModel = CreateAccountViewModel()
    
    @IBOutlet var customView: UIView! {
        didSet {
            self.customView.backgroundColor = .black
        }
    }
    
    @IBOutlet weak var imageCustomView: UIImageView! {
        didSet {
            self.imageCustomView.image = UIImage(named: "Icon")
        }
    }
    
    @IBOutlet weak var signUpLabel: UILabel! {
        didSet {
            self.signUpLabel.text = "Sign Up"
            self.signUpLabel.font = .preferredFont(forTextStyle: .title1)
            self.signUpLabel.textColor = .purple
        }
    }
    
    @IBOutlet weak var createYourAccountLabel: UILabel! {
        didSet {
            self.createYourAccountLabel.text = "Create your account"
            self.createYourAccountLabel.layer.opacity = 0.8
            self.createYourAccountLabel.textColor = .purple
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
    
    @IBOutlet weak var signUpButton: UIButton! {
        didSet {
            self.signUpButton.tintColor = .purple
            self.signUpButton.setTitle("Sing Up", for: .normal)
            self.signUpButton.setTitleColor(.black, for: .normal)
        }
    }
    
    @IBOutlet weak var termsLabel: UILabel! {
        didSet {
            self.termsLabel.text = "Terms & Policy"
            self.termsLabel.textColor = .purple
        }
    }
    
    @IBAction func singUpButtonTaped(_ sender: UIButton) {
        guard  let email = emailTextField.text, let pass = passwordTextField.text else { return }
        viewModel.createUser(email: email, password: pass)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.viewController = self
    }
    
}
