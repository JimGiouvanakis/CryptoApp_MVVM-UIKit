//
//  LoginScreenViewModel.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 21/11/24.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginScreenViewModel {
    
    weak var viewController: LoginScreenViewController?
    
    func singIn(email: String , password : String) {
        Task {
            do {
                try await AuthenticationManager.shared.singInUser(email: email, password: password)
                await self.viewController?.signInPassed(status: .email)
            } catch let authErrors as NSError {
                
                if let errorCode = AuthErrorCode(rawValue: authErrors.code) {
                    let storyboard = await UIStoryboard(name: "AuthenticationErrorHandlingViewController", bundle: nil)
                    if let pushViewController = await storyboard.instantiateViewController(withIdentifier: "AuthenticationErrorHandlingViewController") as? AuthenticationErrorHandlingViewController {
                        
                        let error = AuthenticationManager.shared.handleError(errorCode: errorCode)
                        
                        pushViewController.text = error
                        
                        await self.viewController?.present(pushViewController, animated: true)
                    }
                }
            }
        }
    }
}
