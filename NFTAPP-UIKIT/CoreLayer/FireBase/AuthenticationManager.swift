//
//  AuthenticationManager.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 21/11/24.
//

import Foundation
import UIKit
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift


struct AuthDataResultModel {
    let uid: String?
    let email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private init() { }
    
    func createUser(email: String, password: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func singInUser(email: String, password: String) async throws  {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            AppViewModel.shared.userLoggedIn()
        } catch {
            throw error
        }
    }
    
    func resetPassword(password: String) async throws  {
        try await Auth.auth().currentUser?.updatePassword(to: password)
    }
    
    func updateEmail(email: String) async throws {
        guard (Auth.auth().currentUser?.email) != nil else { return }
        do {
            try await Auth.auth().currentUser?.sendEmailVerification(beforeUpdatingEmail: email)
        } catch {
            print(error)
            throw error
        }
    }
    
    func singOut() throws {
        do {
            try Auth.auth().signOut()
            AppViewModel.shared.userLoggedOut()
            print(AppViewModel.shared.isUserLoggedIn.value)
        } catch {
            throw error
        }
    }
    
    func singOutGoogle() throws {
            GIDSignIn.sharedInstance.signOut()
            AppViewModel.shared.userLoggedOut()
            print(AppViewModel.shared.isUserLoggedIn.value)
    }
    
    func  handleError(errorCode: AuthErrorCode) -> String {
        switch errorCode {
        case .invalidEmail:
            return "Invalid Email"
        case .userDisabled:
            return "User is Disabled"
        case .invalidCredential:
            return "Invalid Credential"
        case .emailAlreadyInUse:
            return "Email is Already In Use"
        case .networkError:
            return "Check your Network Connections"
        case .wrongPassword:
            return "Invalid Password"
        case .internalError:
            return "Internal Error"
        default:
            return "Unknown error"
        }
    }
}
