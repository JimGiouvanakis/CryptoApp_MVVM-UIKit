//
//  MoreDetailsTableViewCell.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 4/11/24.
//

import Foundation
import UIKit

class MoreDetailsTableViewCell: UITableViewCell {
    
    var model: NFT?
    
    @IBOutlet weak var stackView: UIStackView! {
        didSet{
            self.stackView.backgroundColor = .black
        }
    }
    
    @IBOutlet weak var nftNameTitle: UILabel! {
        didSet{
            self.nftNameTitle.textColor = .purple
            self.nftNameTitle.font = .preferredFont(forTextStyle: .title1)
        }
    }
    
    @IBOutlet weak var imageCustomView: ImageCustomView!
    
    @IBOutlet weak var moreInfoView: MoreInfoView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .black
    }
    
    func setUp(model: NFT) {
        self.model = model
    }
}
