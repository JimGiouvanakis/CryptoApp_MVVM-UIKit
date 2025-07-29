//
//  SettingsViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 21/11/24.
//

import Foundation
import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    let viewModel = SettingsViewModel()
    
    @IBOutlet var customView: UIView! {
        didSet {
            self.customView.backgroundColor = .black
        }
    }
    
    @IBOutlet weak var tittleLabel: UILabel! {
        didSet {
            self.tittleLabel.text = "Settings"
            self.tittleLabel.font = .preferredFont(forTextStyle: .title1)
            self.tittleLabel.textColor = .purple
        }
    }
    
    @IBOutlet weak var signOutButton: UIButton! {
        didSet {
            self.signOutButton.setTitle("Log Out", for: .normal)
            self.signOutButton.tintColor = .purple
            self.signOutButton.setTitleColor(.black, for: .normal)
                self.signOutButton.isHidden = AppViewModel.shared.isUserLoggedIn.value == .email || AppViewModel.shared.isUserLoggedIn.value == .google ? false : true
        }
    }
    
    @IBOutlet weak var updatePassword: UIButton! {
        didSet {
            self.updatePassword.setTitle("Update Password", for: .normal)
            self.updatePassword.tintColor = .purple
            self.updatePassword.setTitleColor(.black, for: .normal)
            self.updatePassword.isHidden = AppViewModel.shared.isUserLoggedIn.value == .email  ? false : true
        }
    }
    
    @IBOutlet weak var updateEmail: UIButton! {
        didSet {
            self.updateEmail.setTitle("Update Email", for: .normal)
            self.updateEmail.tintColor = .purple
            self.updateEmail.setTitleColor(.black, for: .normal)
            self.updateEmail.isHidden = AppViewModel.shared.isUserLoggedIn.value == .email  ? false : true
        }
    }
    
    @IBOutlet weak var singinButton: UIButton! {
        didSet {
            self.singinButton.setTitle("Log In", for: .normal)
            self.singinButton.tintColor = .purple
            self.singinButton.setTitleColor(.black, for: .normal)
            self.singinButton.isHidden = AppViewModel.shared.isUserLoggedIn.value == .email || AppViewModel.shared.isUserLoggedIn.value == .google ? true : false
        }
    }
    
    @IBAction func singOutButtonTaped(_ sender: UIButton) {
        Task { try self.viewModel.signOut() }
        
        let storyboard = UIStoryboard(name: "LoginScreenViewController", bundle: nil)
        if let loginScreenViewController = storyboard.instantiateViewController(withIdentifier: "LoginScreenViewController") as? LoginScreenViewController {
            self.navigationController?.navigationBar.tintColor = .purple
            self.navigationController?.pushViewController(loginScreenViewController, animated: true)
        }
    }
    
    @IBAction func updatePasswordButtonTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "PasswordChangePopUpViewController", bundle: nil)
        if let popUpViewController = storyboard.instantiateViewController(withIdentifier: "PasswordChangePopUpViewController") as? PasswordChangePopUpViewController {
            
            popUpViewController.passwordChangeDelegate = self
            
            self.present(popUpViewController, animated: true)
        }
    }
    
    @IBAction func updateEmailButtonTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "SettingsPopUpViewController", bundle: nil)
        if let popUpViewController = storyboard.instantiateViewController(withIdentifier: "SettingsPopUpViewController") as? SettingsPopUpViewController {
            popUpViewController.settingsPopUpdelegage = self
            self.present(popUpViewController, animated: true)
        }
    }
    
    @IBAction func singInButtonTaped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "LoginScreenViewController", bundle: nil)
        if let loginScreenViewController = storyboard.instantiateViewController(withIdentifier: "LoginScreenViewController") as? LoginScreenViewController {
            self.navigationController?.navigationBar.tintColor = .purple
            self.navigationController?.pushViewController(loginScreenViewController, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerObservers()
    }
    
    func registerObservers() {
        AppViewModel.shared.isUserLoggedIn.addObserver { [weak self] newValue in
            if newValue == .email {
                self?.signOutButton.isHidden = false
                self?.updatePassword.isHidden = false
                self?.updateEmail.isHidden = false
                self?.singinButton.isHidden = true
            } else  if newValue == .loggedOut {
                self?.signOutButton.isHidden = true
                self?.updatePassword.isHidden = true
                self?.updateEmail.isHidden = true
                self?.singinButton.isHidden = false
            } else  if newValue == .google  {
                self?.signOutButton.isHidden = false
                self?.updatePassword.isHidden = true
                self?.updateEmail.isHidden = true
                self?.singinButton.isHidden = true
            }
        }
    }
}


extension SettingsViewController: SettingsPopUpViewControllerProtocol {
    func changeEmail(email: String) {
        Task  {
            do {
                try await self.viewModel.updateEmail(email:email)
                
                self.dismiss(animated: true)
                
                try  self.viewModel.signOut()
                
                let storyboard = UIStoryboard(name: "LogInPopUpViewController", bundle: nil)
                if let popUpViewController = storyboard.instantiateViewController(withIdentifier: "LogInPopUpViewController") as? LogInPopUpViewController {
                    
                    popUpViewController.logInPopUpDelegate = self
                    self.present(popUpViewController, animated: true)
                }
            } catch let authErrors as NSError {
                
                self.dismiss(animated: true)
                
                // Sing in Again Case from updateEmail
                if authErrors.code == 17014  {
                    
                    try  self.viewModel.signOut()
                    
                    let storyboard = UIStoryboard(name: "LogInPopUpViewController", bundle: nil)
                    if let popUpViewController = storyboard.instantiateViewController(withIdentifier: "LogInPopUpViewController") as? LogInPopUpViewController {
                        
                        popUpViewController.logInPopUpDelegate = self
                        self.present(popUpViewController, animated: true)
                    }
                } else {
                    if let errorCode = AuthErrorCode(rawValue: authErrors.code) {
                        print(errorCode)
                        let storyboard =  UIStoryboard(name: "AuthenticationErrorHandlingViewController", bundle: nil)
                        if let pushViewController =  storyboard.instantiateViewController(withIdentifier: "AuthenticationErrorHandlingViewController") as? AuthenticationErrorHandlingViewController {
                            
                            let error = AuthenticationManager.shared.handleError(errorCode: errorCode)
                            
                            pushViewController.text = error
                            
                            self.present(pushViewController, animated: true)
                        }
                    }
                }
            }
        }
    }
}

extension SettingsViewController: LogInPopUpViewControllerProtocol {
    func singIn(email: String, password: String) async -> Bool? {
        
        do {
            try self.viewModel.signOut()
            
            let status = try await self.viewModel.singIn(email: email, password: password)
            
            self.dismiss(animated: true) {
                let storyboard = UIStoryboard(name: "ConfirmPopUpViewController", bundle: nil)
                if let popUpViewController = storyboard.instantiateViewController(withIdentifier: "ConfirmPopUpViewController") as? ConfirmPopUpViewController {
                    
                    popUpViewController.text = "Your request has sent in your new Email Address"
                    
                    self.present(popUpViewController, animated: true)
                }
            }
            return status
        } catch {
            print(error)
            return false
        }
        
    }
}

extension SettingsViewController: PasswordChangePopUpViewControllerProtocol {
    func okButtonTapped(password: String) {
        Task {
            try await self.viewModel.updatePassword(password: password)
            
            let storyboard = UIStoryboard(name: "ConfirmPopUpViewController", bundle: nil)
            if let popUpViewController = storyboard.instantiateViewController(withIdentifier: "ConfirmPopUpViewController") as? ConfirmPopUpViewController {
                
                popUpViewController.text = "Your Password is updated Successfully"
                
                self.present(popUpViewController, animated: true)
            }
        }
        
    }
}
