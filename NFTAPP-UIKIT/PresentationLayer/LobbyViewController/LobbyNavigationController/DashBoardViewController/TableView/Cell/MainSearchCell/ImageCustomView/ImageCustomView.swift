//
//  ImageCustomView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 24/10/24.
//

import Foundation
import UIKit

class ImageCustomView: UIView {
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            self.imageView.layer.cornerRadius = 20
            self.imageView.contentMode = .scaleAspectFill
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
        guard let view = self.loadViewFromNib(nibName: "ImageCustomView") else { return }
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
