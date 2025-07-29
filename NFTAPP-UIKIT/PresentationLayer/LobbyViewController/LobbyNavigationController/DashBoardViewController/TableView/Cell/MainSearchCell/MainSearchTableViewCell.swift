//
//  MainSearchTableViewCell.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/10/24.
//

import Foundation
import UIKit

protocol MainSearchTableViewCellProtocol: AnyObject {
    func didTapMoreDetails(model: NFT?)
    func didTapFavButton(model: NFT?)
}

class MainSearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var imageCustomView: ImageCustomView! {
        didSet {
            self.imageCustomView.layer.cornerRadius = 20
            self.imageCustomView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var informationView: InformationCustomView! {
        didSet {
            self.informationView.layer.cornerRadius = 20
            self.informationView.backgroundColor = .clear
            self.informationView.delegate = self
        }
    }
    
    var model: NFT?
    
    weak var delegate: MainSearchTableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    
    func setUp2(model: NFT, delegate: MainSearchTableViewCellProtocol?) {
        self.model = model
        self.delegate = delegate
        self.stackView.layer.cornerRadius = 20.0
        self.stackView.layer.borderWidth = 4.0
        self.stackView.layer.borderColor = UIColor.gray.cgColor
        
        self.imageCustomView.setUp(imageUrl: model.imageUrl)
        self.informationView.setUp(model: model)
    }
}

extension MainSearchTableViewCell: InformationCustomViewProtocol {
    
    func didTapMoreDetails() {
        self.delegate?.didTapMoreDetails(model: model)    }
    
    func didTapFavButton() {
        if self.model?.isFavorite == true {
            self.model?.isFavorite = false
        } else {
            self.model?.isFavorite = true
        }
        self.delegate?.didTapFavButton(model: model)
    }
}
