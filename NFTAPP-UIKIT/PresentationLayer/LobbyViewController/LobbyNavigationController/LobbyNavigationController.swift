//
//  LobbyNavigationViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 14/11/24.
//

import Foundation
import UIKit

class LobbyNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewController = LobbyViewController()
        self.pushViewController(viewController, animated: true)
    }
}
