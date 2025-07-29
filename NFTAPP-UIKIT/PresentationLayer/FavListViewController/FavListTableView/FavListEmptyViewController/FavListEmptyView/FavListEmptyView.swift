//
//  FavListEmptyView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 28/11/24.
//

import Foundation
import UIKit


class FavListEmptyView: UIView {
    
    @IBOutlet var customView: UIView! {
        didSet {
            self.customView.backgroundColor = .purple
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            self.titleLabel.text = "Sign In to get access to Favorite list"
            self.titleLabel.font = .preferredFont(forTextStyle: .title1)
            self.titleLabel.textColor = .black
        }
    }
    @IBOutlet weak var singInButton: UIButton! {
        didSet {
            self.singInButton.setTitle("Sing In", for: .normal)
            self.singInButton.tintColor = .black
            self.singInButton.setTitleColor(.purple, for: .normal)
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
        guard let view = self.loadViewFromNib(nibName: "FavListEmptyView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
}
