//
//  InformationCustomView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 24/10/24.
//

import Foundation
import UIKit

protocol InformationCustomViewProtocol: AnyObject {
    func didTapMoreDetails()
    func didTapFavButton()
}

class InformationCustomView: UIView {
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var titleLael: UILabel! {
        didSet {
            self.titleLael.textColor = .purple
        }
    }
    
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            self.priceLabel.textColor = .purple
        }
    }
    
    @IBOutlet weak var favButton: UIButton! {
        didSet {
            self.favButton.setTitle("", for: .normal)
            self.favButton.setImage(UIImage(systemName: "heart"), for: .normal)
            self.favButton.tintColor = .purple
        }
    }
    
    @IBOutlet weak var moreDetailButton: UIButton! {
        didSet {
            self.moreDetailButton.setTitle("More Details", for: .normal)
            self.moreDetailButton.tintColor = .purple
            self.moreDetailButton.setTitleColor(.black, for: .normal)
        }
    }
    
    
    weak var delegate: InformationCustomViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    func configureView() {
        guard let view = self.loadViewFromNib(nibName: "InformationCustomView") else { return }
        view.frame = self.bounds
        view.backgroundColor = .black
        self.addSubview(view)
    }
    
    func setUp(model: NFT) {
        self.titleLael.text = model.name
        self.priceLabel.text = model.floorPrice.amount + "  " +  model.floorPrice.unit
        if model.isFavorite == true {
            self.favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            self.favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }

    @IBAction func moreDetailsButtonTapped(_ sender: UIButton) {
        self.delegate?.didTapMoreDetails()
    }
    
    @IBAction func favButtonTapped(_ sender: UIButton) {
        self.delegate?.didTapFavButton()
    }
}

