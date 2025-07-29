//
//  TabView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 13/11/24.
//

import Foundation
import UIKit

protocol TabViewProtocol: AnyObject {
    func didTapHomeButton()
    func didTapSearchButton()
    func didTapFavoriteButton()
    func didTapSettingsButton()
}


class TabView: UIView {
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var homeButton: UIButton! {
        didSet {
            self.homeButton.setTitle(" ", for: .normal)
            self.homeButton.setImage(UIImage(systemName: "house"), for: .normal)
            self.homeButton.tintColor = .purple
        }
    }
    
    @IBOutlet weak var searchViewButton: UIButton! {
        didSet {
            self.searchViewButton.setTitle(" ", for: .normal)
            self.searchViewButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            self.searchViewButton.tintColor = .purple
        }
    }
    
    @IBOutlet weak var favoriteViewButton: UIButton! {
        didSet {
            self.favoriteViewButton.setTitle(" ", for: .normal)
            self.favoriteViewButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            self.favoriteViewButton.tintColor = .purple
        }
    }
    
    @IBOutlet weak var settingViewButton: UIButton! {
        didSet {
            self.settingViewButton.setTitle(" ", for: .normal)
            self.settingViewButton.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
            self.settingViewButton.tintColor = .purple
        }
    }
    
    weak var delegate: TabViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    func configureView() {
        guard let view = self.loadViewFromNib(nibName: "TabView") else { return }
        view.frame = self.bounds
        view.backgroundColor = .black
        self.addSubview(view)
    }
    
    @IBAction func didTapHomeButton(_ sender: UIButton) {
        self.delegate?.didTapHomeButton()
    }
    
    @IBAction func didTapSearchButton(_ sender: UIButton) {
        self.delegate?.didTapSearchButton()
    }
    
    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
        self.delegate?.didTapFavoriteButton()
    }
    
    @IBAction func didTapSettingButton(_ sender: UIButton) {
        self.delegate?.didTapSettingsButton()
    }
}
