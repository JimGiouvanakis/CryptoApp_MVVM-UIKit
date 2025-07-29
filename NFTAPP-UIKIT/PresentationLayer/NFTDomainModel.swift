//
//  NFTDomainModel.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 22/10/24.
//

import Foundation

//Domain Model that app uses
struct NFT: Identifiable, Equatable {
    static func == (lhs: NFT, rhs: NFT) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var contractAddress: String
    var name: String
    var slug: String
    var imageUrl: String
    var totalSupply: Int
    var numberOwners: Int
    var floorPrice: FloorPrice
    var floorPriceOneDay: FloorPrice
    var floorPriceOneWeek: FloorPrice
    var volumeFifteenMinute: String
    var volumeOneDay: FloorPrice
    var volumeOneWeek: FloorPrice
    var bestCollectionBid: FloorPrice
    var totalCollectionBidValue: FloorPrice
    var traitFrequencies: String
    var isFavorite: Bool?
    
    init(
        contractAddress: String,
        name: String,
        slug: String,
        imageUrl: String,
        totalSupply: Int,
        numberOwners: Int,
        floorPrice: FloorPrice,
        floorPriceOneDay: FloorPrice,
        floorPriceOneWeek: FloorPrice,
        volumeFifteenMinute: String,
        volumeOneDay: FloorPrice,
        volumeOneWeek: FloorPrice,
        bestCollectionBid: FloorPrice,
        totalCollectionBidValue: FloorPrice,
        traitFrequencies: String,
        isFavorite: Bool?
    ) {
        self.contractAddress = contractAddress
        self.name = name
        self.slug = slug
        self.imageUrl = imageUrl
        self.totalSupply = totalSupply
        self.numberOwners = numberOwners
        self.floorPrice = floorPrice
        self.floorPriceOneDay = floorPriceOneDay
        self.floorPriceOneWeek = floorPriceOneWeek
        self.volumeFifteenMinute = volumeFifteenMinute
        self.volumeOneDay = volumeOneDay
        self.volumeOneWeek = volumeOneWeek
        self.bestCollectionBid = bestCollectionBid
        self.totalCollectionBidValue = totalCollectionBidValue
        self.traitFrequencies = traitFrequencies
        self.isFavorite = isFavorite
    }
    
    init(entity: NFTEntity) {
        self.contractAddress = entity.contractAddress ?? ""
        self.name = entity.name ?? ""
        self.slug = entity.slug ?? ""
        self.imageUrl = entity.imageUrl ?? ""
        self.totalSupply = entity.totalSupply ?? 0
        self.numberOwners = entity.numberOwners ?? 0
        self.floorPrice = .init(entity: entity.floorPrice)
        self.floorPriceOneDay = .init(entity: entity.floorPriceOneDay)
        self.floorPriceOneWeek = .init(entity: entity.floorPriceOneWeek)
        self.volumeFifteenMinute = entity.volumeFifteenMinute ?? ""
        self.volumeOneDay = .init(entity: entity.volumeOneDay)
        self.volumeOneWeek = .init(entity: entity.volumeOneWeek)
        self.bestCollectionBid = .init(entity: entity.bestCollectionBid)
        self.totalCollectionBidValue = .init(entity: entity.totalCollectionBidValue)
        self.traitFrequencies = entity.traitFrequencies ?? ""
        self.isFavorite = nil
    }
}

struct FloorPrice {
    
    let amount: String
    let unit: String
    
    init(amount: String, unit: String) {
        self.amount = amount
        self.unit = unit
    }
    
    init(entity: FloorPriceEntity?) {
        self.amount = entity?.amount ?? ""
        self.unit = entity?.unit ?? ""
    }
}
