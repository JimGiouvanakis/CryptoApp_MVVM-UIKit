//
//  AppViewModel.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 27/11/24.
//

import Foundation

class AppViewModel {
    
    static let shared = AppViewModel()
    
    var isUserLoggedIn = Observable<UserLogStatus>(value: .loggedOut)
    
    func userLoggedInGoogle() {
        self.isUserLoggedIn.value = .google
    }
    
    func userLoggedIn() {
        self.isUserLoggedIn.value = .email
    }
    
    func userLoggedOut() {
        self.isUserLoggedIn.value  = .loggedOut
    }
}


enum UserLogStatus {
    case email
    case google
    case loggedOut
}
