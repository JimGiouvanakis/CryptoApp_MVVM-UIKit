//
//  CreateAccountViewModel.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 21/11/24.
//

import Foundation
import UIKit
import FirebaseAuth

class CreateAccountViewModel {
    
    weak var viewController: CreateAccountViewController?
    
    func createUser(email: String , password : String) {
        Task {
            do {
                try await AuthenticationManager.shared.createUser(email: email , password: password)
                let storyboard = await UIStoryboard(name: "ConfirmPopUpViewController", bundle: nil)
                if let sheetViewController = await storyboard.instantiateViewController(withIdentifier: "ConfirmPopUpViewController") as? ConfirmPopUpViewController {
                    
                    sheetViewController.text = "Your Account is Created"
                    
                    await self.viewController?.present(sheetViewController, animated: true)
                    
                    await self.viewController?.navigationController?.popViewController(animated: true)
                }
            } catch let authErrors as NSError {
                
                if let errorCode = AuthErrorCode(rawValue: authErrors.code) {
                    let storyboard = await UIStoryboard(name: "AuthenticationErrorHandlingViewController", bundle: nil)
                    if let sheetViewController = await storyboard.instantiateViewController(withIdentifier: "AuthenticationErrorHandlingViewController") as? AuthenticationErrorHandlingViewController {
                        
                        let error = AuthenticationManager.shared.handleError(errorCode: errorCode)
                        
                        sheetViewController.text = error
                        
                        await self.viewController?.present(sheetViewController, animated: true)
                    }
                }
            }
        }
    }
}

