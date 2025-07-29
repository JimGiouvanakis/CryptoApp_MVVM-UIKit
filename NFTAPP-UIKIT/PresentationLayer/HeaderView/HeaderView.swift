//
//  HeaderView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 5/11/24.
//

import Foundation
import UIKit

protocol HeaderViewProtocol: AnyObject {
    func didTapFavButton()
}

class HeaderView: UIView {
    
    @IBOutlet var view: UIView! {
        didSet {
            self.view.backgroundColor = .black
        }
    }
    
    @IBOutlet weak var tableTitle: UILabel!{
        didSet{
            self.tableTitle.text = "NFT List"
            self.tableTitle.textColor = .purple
            self.tableTitle.font = .preferredFont(forTextStyle: .largeTitle)
        }
    }
    
    @IBOutlet weak var favListButton: UIButton! {
        didSet{
            self.favListButton.setTitle("", for: .normal)
            self.favListButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
            self.favListButton.tintColor = .purple
            self.favListButton.sizeToFit()
        }
    }
    
    weak var headerViewDelegate: HeaderViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    func configureView() {
        guard let view = self.loadViewFromNib(nibName: "HeaderView") else { return }
        view.frame = self.bounds
        view.backgroundColor = .black
        self.addSubview(view)
    }
    
    
    func setUp(headerViewDelegate: HeaderViewProtocol?) {
        self.headerViewDelegate = headerViewDelegate
    }
    
    @IBAction func didTapFavButton(_ sender: Any){
        self.headerViewDelegate?.didTapFavButton()
    }
}
