//
//  LobbyFlowCoordinator.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 19/11/24.
//

import UIKit

protocol LobbyFlowCoordinatorProtocol: AnyObject {
    func openFavListSheet(nfts: [NFT])
}

class LobbyFlowCoordinator: LobbyFlowCoordinatorProtocol {
    
    weak var viewController: LobbyViewController?
    
    func openFavListSheet(nfts: [NFT]) {
        
        if AppViewModel.shared.isUserLoggedIn.value != .loggedOut {
            let storyboard = UIStoryboard(name: "FavListViewController", bundle: nil)
            if let sheetViewController = storyboard.instantiateViewController(withIdentifier: "FavListViewControllerIdentifier") as? FavListViewController {
                
                sheetViewController.model = nfts
                
                self.viewController?.present(sheetViewController, animated: true)
            } else {
                return
            }
        } else {
            let storyboard = UIStoryboard(name: "FavListEmptyViewController", bundle: nil)
            if let sheetViewController = storyboard.instantiateViewController(withIdentifier: "FavListEmptyViewController") as? FavListEmptyViewController {
                
                
                self.viewController?.present(sheetViewController, animated: true)
            }
        }
    }
}
