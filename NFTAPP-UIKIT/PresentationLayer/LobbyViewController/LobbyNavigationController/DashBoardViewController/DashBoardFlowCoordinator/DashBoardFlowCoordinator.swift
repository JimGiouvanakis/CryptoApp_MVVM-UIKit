//
//  DashBoardFlowCoordinator.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 12/11/24.
//

import UIKit

protocol DashBoardFlowCoordinatorProtocol: AnyObject {
    func openMoreDetailsSheet(model: NFT?)
    func pushMoreDetailsView(model: NFT?)
}

class DashBoardFlowCoordinator: DashBoardFlowCoordinatorProtocol {
    
    weak var viewController: DashBoardViewController?
    
    func openMoreDetailsSheet(model: NFT?) {
        let storyboard = UIStoryboard(name: "MoreDetailsViewController", bundle: nil)
        if let moreDetailsViewController = storyboard.instantiateViewController(withIdentifier: "MoreDetailsViewControllerIdentifier") as? MoreDetailsViewController {
            
            moreDetailsViewController.model = model
            
            self.viewController?.present(moreDetailsViewController, animated: true)
        } else {
            return
        }
    }
    
    func pushMoreDetailsView(model: NFT?) {
        
        let storyboard = UIStoryboard(name: "MoreDetailsViewController", bundle: nil)
        if let moreDetailsViewController = storyboard.instantiateViewController(withIdentifier: "MoreDetailsViewControllerIdentifier") as? MoreDetailsViewController {
        
            moreDetailsViewController.model = model
            
            self.viewController?.navigationController?.pushViewController(moreDetailsViewController, animated: true)
        } else {
            return
        }

    }
    
}
