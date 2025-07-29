//
//  MoreInfoView.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 4/11/24.
//

import Foundation
import UIKit


class MoreInfoView: UIView {
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            self.nameLabel.textColor = .purple
            self.nameLabel.layer.opacity = 0.6
            self.nameLabel.text = "Name:"
        }
    }
    
    @IBOutlet weak var nftNameLabel: UILabel!{
        didSet {
            self.nftNameLabel.textColor = .purple
        }
    }
    
    @IBOutlet weak var slugNameLabel: UILabel!{
        didSet {
            self.slugNameLabel.textColor = .purple
            self.slugNameLabel.layer.opacity = 0.6
            self.slugNameLabel.text = "Slug Name:"
        }
    }
    
    @IBOutlet weak var nftSlugNameLabel: UILabel!{
        didSet {
            self.nftSlugNameLabel.textColor = .purple
        }
    }
    
    @IBOutlet weak var totalSupplyLabel: UILabel!{
        didSet {
            self.totalSupplyLabel.textColor = .purple
            self.totalSupplyLabel.layer.opacity = 0.6
            self.totalSupplyLabel.text = "Total Supply:"
            
        }
    }
    
    @IBOutlet weak var nftTotalSupplyLabel: UILabel!{
        didSet {
            self.nftTotalSupplyLabel.textColor = .purple
        }
    }
    //
    @IBOutlet weak var numberOfOwnersLabel: UILabel!{
        didSet {
            self.numberOfOwnersLabel.textColor = .purple
            self.numberOfOwnersLabel.layer.opacity = 0.6
            self.numberOfOwnersLabel.text = "Number of Owners:"
        }
    }
    //
    @IBOutlet weak var nftNumberOfOwnersLabel: UILabel!{
        didSet {
            self.nftNumberOfOwnersLabel.textColor = .purple
        }
    }
    //
    @IBOutlet weak var floorPriceLabel: UILabel! {
        didSet {
            self.floorPriceLabel.textColor = .purple
            self.floorPriceLabel.layer.opacity = 0.6
            self.floorPriceLabel.text = "Floor Price:"
        }
    }
    
    
    @IBOutlet weak var nftFloorPriceLabel: UILabel! {
        didSet {
            self.nftFloorPriceLabel.textColor = .purple
        }
    }
    
    @IBOutlet weak var floorPriceOneDayLabel: UILabel! {
        didSet{
            self.floorPriceOneDayLabel.textColor = .purple
            self.floorPriceOneDayLabel.layer.opacity = 0.6
            self.floorPriceOneDayLabel.text = "Floor Price of One Day:"
        }
    }
    
    @IBOutlet weak var nftFloorPriceOneDayLabel: UILabel! {
        didSet{
            self.nftFloorPriceOneDayLabel.textColor = .purple
        }
    }
    
    @IBOutlet weak var floorPriceOneWeekLabel: UILabel! {
        didSet{
            self.floorPriceOneWeekLabel.textColor = .purple
            self.floorPriceOneWeekLabel.layer.opacity = 0.6
            self.floorPriceOneWeekLabel.text = "Floor Price of One Week:"
        }
    }
    
    @IBOutlet weak var nftFloorPriceOneWeekLabel: UILabel! {
        didSet{
            self.nftFloorPriceOneWeekLabel.textColor = .purple
        }
    }
    
    @IBOutlet weak var volumeOfDayLabel: UILabel! {
        didSet{
            self.volumeOfDayLabel.textColor = .purple
            self.volumeOfDayLabel.layer.opacity = 0.6
            self.volumeOfDayLabel.text = "Volume Of the Day:"
        }
    }
    
    @IBOutlet weak var nftvolumeOfDayLabel: UILabel! {
        didSet{
            self.nftvolumeOfDayLabel.textColor = .purple
        }
    }
    
    @IBOutlet weak var volumeOfWeekLabel: UILabel! {
        didSet{
            self.volumeOfWeekLabel.textColor = .purple
            self.volumeOfWeekLabel.layer.opacity = 0.6
            self.volumeOfWeekLabel.text = "Volume Of the Week:"
        }
    }
    
    @IBOutlet weak var nftVolumeOfWeekLabel: UILabel! {
        didSet{
            self.nftVolumeOfWeekLabel.textColor = .purple
        }
    }
    
    @IBOutlet weak var collectionBidLabel: UILabel! {
        didSet{
            self.collectionBidLabel.textColor = .purple
            self.collectionBidLabel.layer.opacity = 0.6
            self.collectionBidLabel.text = "Best Collection Bid:"
        }
    }
    
    @IBOutlet weak var nftCollcetionBidLabel: UILabel! {
        didSet{
            self.nftCollcetionBidLabel.textColor = .purple
        }
    }
    
    @IBOutlet weak var totalCollectionBidLabel: UILabel! {
        didSet{
            self.totalCollectionBidLabel.textColor = .purple
            self.totalCollectionBidLabel.layer.opacity = 0.6
            self.totalCollectionBidLabel.text = "Total Collection Bid Value:"
        }
    }
    
    @IBOutlet weak var nftTotalCollectionBidLabel: UILabel! {
        didSet{
            self.nftTotalCollectionBidLabel.textColor = .purple
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
        guard let view = self.loadViewFromNib(nibName: "MoreInfoView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
        self.view.backgroundColor = .black
    }
    
    func setUpmoreInfo(model: NFT?) {
        if let model {
            self.nftNameLabel.text = model.name
            self.nftSlugNameLabel.text = model.slug
            self.nftTotalSupplyLabel.text = model.totalSupply.description
            self.nftNumberOfOwnersLabel.text = model.numberOwners.description
            self.nftFloorPriceOneDayLabel.text = model.floorPriceOneDay.amount.description + " " + model.floorPriceOneDay.unit
            self.nftFloorPriceOneWeekLabel.text = model.floorPriceOneWeek.amount.description + " " + model.floorPriceOneWeek.unit
            self.nftvolumeOfDayLabel.text = model.volumeOneDay.amount.description + " " + model.volumeOneDay.unit
            self.nftVolumeOfWeekLabel.text = model.volumeOneWeek.amount.description + " " + model.volumeOneWeek.unit
            self.nftCollcetionBidLabel.text = model.bestCollectionBid.amount.description + " " + model.bestCollectionBid.unit
            self.nftTotalCollectionBidLabel.text = model.totalCollectionBidValue.amount.description + " " + model.totalCollectionBidValue.unit
        }
    }
}
