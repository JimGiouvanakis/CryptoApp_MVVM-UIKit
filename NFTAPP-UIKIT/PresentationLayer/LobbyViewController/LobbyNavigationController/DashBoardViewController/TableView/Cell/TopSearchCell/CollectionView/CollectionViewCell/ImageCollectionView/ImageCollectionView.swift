//
//  ImageCollectionView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 25/10/24.
//

import Foundation
import UIKit

class ImageCollectionView: UIView {
    
    @IBOutlet var View: UIView!
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            self.imageView.layer.cornerRadius = 20.0
            self.imageView.contentMode = .scaleAspectFit
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
        guard let view = self.loadViewFromNib(nibName:  "ImageCollectionView") else { return }
        view.frame = self.bounds
        view.backgroundColor = .black
        self.addSubview(view)
    }
    
    func setUp(imageUrl: String) {
        if let url = URL(string: imageUrl) {
            imageView.imageFrom(url: url)
        }
    }
    
}
