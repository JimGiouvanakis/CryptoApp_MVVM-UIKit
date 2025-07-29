//
//  PopUpView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 22/11/24.
//

import Foundation
import UIKit
import FirebaseAuth

protocol PopUpViewProtocol: AnyObject {
    func okButtonTapped()
}

class PopUpView: UIView {
    
    weak var delegate: PopUpViewProtocol?
    
    @IBOutlet var customView: UIView! {
        didSet {
            self.customView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var customImageView: UIImageView! {
        didSet {
            self.customImageView.image = UIImage(named: "WarningIcon")
        }
    }

    @IBOutlet weak var warningLabel1: UILabel! {
        didSet {
            self.warningLabel1.text = "Wrong Crententials"
            self.warningLabel1.font = .preferredFont(forTextStyle: .title2)
        }
    }
    
    @IBOutlet weak var warningLabel2: UILabel! {
            didSet {
                self.warningLabel2.text = "Try again"
                self.warningLabel2.font = .preferredFont(forTextStyle: .title3)
            }
        }
    
    @IBOutlet weak var okButton: UIButton! {
        didSet {
            self.okButton.tintColor = .black
            self.okButton.setTitle("Ok", for: .normal)
            self.okButton.setTitleColor(.purple, for: .normal)
        }
    }
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        self.delegate?.okButtonTapped()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    func configureView() {
        guard let view = self.loadViewFromNib(nibName: "PopUpView") else { return }
        view.frame = self.bounds
        view.backgroundColor = .purple
        view.layer.cornerRadius = 10.0
        self.addSubview(view)
    }
    
    func setUpView(warningLabel1: String) {
        self.warningLabel1.text = warningLabel1
    }
}
