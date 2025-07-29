//
//  SectionCellHeaderView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 6/11/24.
//

import UIKit

class SectionCellHeaderView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet{
            self.titleLabel.font = .preferredFont(forTextStyle: .title1)
            self.titleLabel.textColor = .purple
        }
    }
}
