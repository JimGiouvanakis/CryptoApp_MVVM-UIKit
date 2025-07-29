//
//  SplashScreenViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 8/11/24.
//

import Foundation
import UIKit

class SplashScreenViewController: UIViewController {
    
    let nextScrenTimer: TimeInterval = 5.0
    
    @IBOutlet weak var customView: UIView!{
        didSet {
            self.customView.backgroundColor = .black
        }
    }
    
    @IBOutlet weak var labelNFT: UILabel! {
        didSet {
            self.labelNFT.text = "NFT"
            self.labelNFT.font = .preferredFont(forTextStyle: .title1)
            self.labelNFT.textColor = .purple
            self.labelNFT.layer.opacity = 0.4
        }
    }
    
    @IBOutlet weak var labelDetails: UILabel!{
        didSet {
            self.labelDetails.text = "Non Functional Tokens"
            self.labelDetails.font = .preferredFont(forTextStyle: .title2)
            self.labelDetails.textColor = .purple
            self.labelDetails.layer.opacity = 0.4
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startSplashScreen()
        
        Timer.scheduledTimer(timeInterval: nextScrenTimer, target: self, selector: #selector(navigateToMainScreen), userInfo: nil , repeats: false)
    }
    
    func startSplashScreen() {
        UIView.animate(withDuration: 2.5, delay: 0) {
            self.labelNFT.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
            self.labelNFT.layer.opacity = 1.0
            
            self.labelDetails.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
            self.labelDetails.layer.opacity = 1.0
        }
    }
    
    @objc func navigateToMainScreen() {
        let storyboard = UIStoryboard(name: "LoginScreenViewController", bundle: nil)
        if let mainViewController = storyboard.instantiateViewController(withIdentifier: "LoginScreenNavigationController") as? UINavigationController {
            mainViewController.modalTransitionStyle = .crossDissolve
            mainViewController.modalPresentationStyle = .fullScreen
            self.present(mainViewController, animated: true, completion: nil)
        }
    }
}
