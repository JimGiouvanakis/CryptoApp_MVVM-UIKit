//
//  HeaderCollectionReusableView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 31/10/24.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var view: UIView! {
        didSet{
            self.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var headerTitle: UILabel!{
        didSet{
            headerTitle.text = "Top Searches"
            headerTitle.textColor = .purple
            headerTitle.textAlignment = .left
            headerTitle.backgroundColor = .clear
            headerTitle.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        backgroundColor = .red
        addSubview(headerTitle)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerTitle.frame = bounds
    }
}
