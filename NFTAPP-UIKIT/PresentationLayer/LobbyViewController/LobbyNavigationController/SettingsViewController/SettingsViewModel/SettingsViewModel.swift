//
//  SettingsViewModel.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 21/11/24.
//

import Foundation
import UIKit

class SettingsViewModel {
    
    func signOut() throws {
        switch AppViewModel.shared.isUserLoggedIn.value {
        case .email:
            try  AuthenticationManager.shared.singOut()
        case .google:
            try  AuthenticationManager.shared.singOutGoogle()
        case .loggedOut:
            break
        }
    }
    
    func updatePassword(password: String) async throws {
        try await AuthenticationManager.shared.resetPassword(password: password)
    }
    
    func updateEmail(email: String) async throws {
        do {
           try  await AuthenticationManager.shared.updateEmail(email: email)
        } catch {
            print(error)
            throw error
        }
    }
    
    func singIn(email: String, password: String) async throws -> Bool {
        do {
            try  await AuthenticationManager.shared.singInUser(email: email, password: password)
           return true
        } catch {
            print(error)
            throw error
        }
    }
}
