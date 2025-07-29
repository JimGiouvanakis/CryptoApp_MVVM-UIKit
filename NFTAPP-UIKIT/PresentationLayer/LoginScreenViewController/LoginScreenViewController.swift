//
//  LoginScreenViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 20/11/24.
//

import Foundation
import UIKit
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

class LoginScreenViewController : UIViewController {
    
    var viewModel = LoginScreenViewModel()
    
    @IBOutlet var customView: UIView! {
        didSet {
            self.customView.backgroundColor = .black
        }
    }
    
    @IBOutlet weak var customImageView: UIImageView! {
        didSet {
            self.customImageView.image = UIImage(named: "Icon")
        }
    }
    
    @IBOutlet weak var signInLabel: UILabel! {
        didSet {
            self.signInLabel.text = "Sign In"
            self.signInLabel.font = .preferredFont(forTextStyle: .title1)
            self.signInLabel.textColor = .purple
        }
    }
    
    @IBOutlet weak var singInTextLabel: UILabel! {
        didSet {
            self.singInTextLabel.text = "Sing in to your account"
            self.singInTextLabel.layer.opacity = 0.8
            self.singInTextLabel.textColor = .purple
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
            self.singInButton.tintColor = .purple
            self.singInButton.setTitle("Sing In", for: .normal)
        }
    }
    
    @IBOutlet weak var googleSingInButton: UIButton! {
        didSet {
            self.googleSingInButton.setTitle( "Sign in with Google", for: .normal)
            self.googleSingInButton.tintColor = .purple
        }
    }
    
    @IBOutlet weak var createAccountButton: UIButton! {
        didSet {
            self.createAccountButton.setTitle( "New User? Create Account here", for: .normal)
            self.createAccountButton.tintColor = .purple
        }
    }
    
    @IBAction func singInButtonTaped(_ sender: UIButton) {
        guard  let email = emailTextField.text, let pass = passwordTextField.text else { return }
        
        self.viewModel.singIn(email: email, password: pass)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.viewController = self
    }
    
    @IBAction func pushCreateAccount(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "CreateAccountViewController", bundle: nil)
        if let createAccountViewController = storyboard.instantiateViewController(withIdentifier: "CreateAccountViewController") as? CreateAccountViewController {
            self.navigationController?.navigationBar.tintColor = .purple
            self.navigationController?.pushViewController(createAccountViewController, animated: true)
        }
    }
    
    @IBAction func googleOPen(_ sender: UIButton) {
        self.setUpGoogleSingIn()
    }
    
    func signInPassed(status: UserLogStatus) {
        if status == .email {
            AppViewModel.shared.userLoggedIn()
        } else if status == .google {
            AppViewModel.shared.userLoggedInGoogle()
        }
        
        let storyboard = UIStoryboard(name: "LobbyViewController", bundle: nil)
        if let lobbyViewController = storyboard.instantiateViewController(withIdentifier: "LobbyNavigationController") as? UINavigationController {
            lobbyViewController.modalTransitionStyle = .crossDissolve
            lobbyViewController.modalPresentationStyle = .fullScreen
            self.present(lobbyViewController, animated: true, completion: nil)
        }
    }
    
    private func setUpGoogleSingIn() {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { authentication, error in
            if let error = error {
                print("There is an error signing the user in ==> \(error)")
                return
            }
            guard let user = authentication?.user, let idToken = user.idToken?.tokenString else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            print("Cred: \(credential), User: \(user)")
            
            self.signInPassed(status: .google)
            
            }
        }
    }
