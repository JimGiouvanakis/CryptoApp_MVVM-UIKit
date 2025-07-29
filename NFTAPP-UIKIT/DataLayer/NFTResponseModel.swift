//
//  NFTResponseModel.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 22/10/24.
//

import Foundation

//Response Model that server deliver
struct NFTEntity: Codable {
    
    var contractAddress: String?
    var name: String?
    var slug: String?
    var imageUrl: String?
    var totalSupply: Int?
    var numberOwners: Int?
    var floorPrice: FloorPriceEntity?
    var floorPriceOneDay: FloorPriceEntity?
    var floorPriceOneWeek: FloorPriceEntity?
    var volumeFifteenMinute: String?
    var volumeOneDay: FloorPriceEntity?
    var volumeOneWeek: FloorPriceEntity?
    var bestCollectionBid: FloorPriceEntity?
    var totalCollectionBidValue: FloorPriceEntity?
    var traitFrequencies: String?
    var network: Int?
    
    enum CodingKeys: String, CodingKey {
        case contractAddress = "contractAddress"
        case name = "name"
        case slug = "slug"
        case imageUrl = "imageUrl"
        case totalSupply = "totalSupply"
        case numberOwners = "numberOwners"
        case floorPrice = "floorPrice"
        case floorPriceOneDay = "floorPriceOneDay"
        case floorPriceOneWeek = "floorPriceOneWeek"
        case volumeFifteenMinute = "volumeFifteenMinute"
        case volumeOneDay = "volumeOneDay"
        case volumeOneWeek = "volumeOneWeek"
        case bestCollectionBid = "bestCollectionBid"
        case totalCollectionBidValue = "totalCollectionBidValue"
        case traitFrequencies = "traitFrequencies"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        contractAddress = try? values?.decodeIfPresent(String.self, forKey: .contractAddress)
        name = try? values?.decodeIfPresent(String.self, forKey: .name)
        slug = try? values?.decodeIfPresent(String.self, forKey: .slug)
        imageUrl = try? values?.decodeIfPresent(String.self, forKey: .imageUrl)
        totalSupply = try? values?.decodeIfPresent(Int.self, forKey: .totalSupply)
        numberOwners = try? values?.decodeIfPresent(Int.self, forKey: .numberOwners)
        floorPrice = try? values?.decodeIfPresent(FloorPriceEntity.self, forKey: .floorPrice)
        floorPriceOneDay = try? values?.decodeIfPresent(FloorPriceEntity.self, forKey: .floorPriceOneDay)
        floorPriceOneWeek = try? values?.decodeIfPresent(FloorPriceEntity.self, forKey: .floorPriceOneWeek)
        volumeFifteenMinute = try? values?.decodeIfPresent(String.self, forKey: .volumeFifteenMinute)
        volumeOneDay = try? values?.decodeIfPresent(FloorPriceEntity.self, forKey: .volumeOneDay)
        volumeOneWeek = try? values?.decodeIfPresent(FloorPriceEntity.self, forKey: .volumeOneWeek)
        bestCollectionBid = try? values?.decodeIfPresent(FloorPriceEntity.self, forKey: .bestCollectionBid)
        totalCollectionBidValue = try? values?.decodeIfPresent(FloorPriceEntity.self, forKey: .totalCollectionBidValue)
        traitFrequencies = try? values?.decodeIfPresent(String.self, forKey: .traitFrequencies)
    }
}

struct FloorPriceEntity: Codable {
    let amount: String?
    let unit: String?
    
    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case unit = "unit"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        amount = try? values?.decodeIfPresent(String.self, forKey: .amount)
        unit = try? values?.decodeIfPresent(String.self, forKey: .unit)
    }
}
