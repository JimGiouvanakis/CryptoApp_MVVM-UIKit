//
//  FavListTableViewCell.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 5/11/24.
//

import UIKit

class FavListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stackView: UIStackView!{
        didSet {
            self.stackView.backgroundColor = .black
        }
    }
    
    @IBOutlet weak var imageCustomView: ImageCustomView!{
        didSet {
            self.imageCustomView.layer.cornerRadius = 20
            self.imageCustomView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var informationCustomView: InformationCustomView!{
        didSet {
            self.informationCustomView.layer.cornerRadius = 20
            self.informationCustomView.backgroundColor = .clear
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUp()
        self.backgroundColor = .black
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp() {
        self.stackView.layer.cornerRadius = 20.0
        self.stackView.layer.borderWidth = 4.0
        self.stackView.layer.borderColor = UIColor.purple.cgColor
    }
}
