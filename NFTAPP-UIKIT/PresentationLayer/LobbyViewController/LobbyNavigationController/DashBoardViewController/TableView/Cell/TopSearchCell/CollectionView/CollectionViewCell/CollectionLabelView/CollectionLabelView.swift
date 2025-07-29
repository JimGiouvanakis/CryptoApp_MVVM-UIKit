//
//  CollectionLabelView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/10/24.
//

import UIKit

class CollectionLabelView: UIView {
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var nftName: UILabel! {
        didSet{
            self.nftName.textColor = .purple
        }
    }
    
    override convenience init(frame: CGRect) {
        self.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    func configureView() {
        guard let view = self.loadViewFromNib(nibName: "CollectionLabelView") else { return }
        view.frame = self.bounds
        view.backgroundColor = .black
        self.addSubview(view)
    }
    
    func setUp(model: NFT) {
        self.nftName.text = model.name
    }
}
