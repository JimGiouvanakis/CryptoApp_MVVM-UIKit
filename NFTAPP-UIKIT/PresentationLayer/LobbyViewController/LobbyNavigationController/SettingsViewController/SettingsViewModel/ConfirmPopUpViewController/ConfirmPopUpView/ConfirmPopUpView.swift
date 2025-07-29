//
//  ConfirmPopUpView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/11/24.
//

import Foundation
import UIKit

protocol ConfirmPopUpViewProtocol: AnyObject {
    func okButtonTapped()
}

class ConfirmPopUpView: UIView {
    
    @IBOutlet var customView: UIView! {
        didSet {
            self.customView.backgroundColor = .purple
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            self.titleLabel.text = "Your action is complete (check mail if needed)"
            self.titleLabel.font = .preferredFont(forTextStyle: .title2)
            self.titleLabel.textColor = .black
        }
    }
    
    weak var delegate: ConfirmPopUpViewProtocol?
    
    @IBOutlet weak var okButton: UIButton! {
        didSet {
            self.okButton.tintColor = .black
            self.okButton.setTitle("Ok", for: .normal)
            self.okButton.setTitleColor(.purple, for: .normal)
        }
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
        guard let view = self.loadViewFromNib(nibName: "ConfirmPopUpView") else { return }
        view.frame = self.bounds
        view.backgroundColor = .purple
        view.layer.cornerRadius = 10.0
        self.addSubview(view)
    }
    
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        self.delegate?.okButtonTapped()
    }
    
    func setUpViewLabel(text: String) {
        self.titleLabel.text = text
    }
    
}
