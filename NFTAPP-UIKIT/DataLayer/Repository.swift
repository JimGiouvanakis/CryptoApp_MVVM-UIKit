//
//  Repository.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 22/10/24.
//

import Foundation

struct NFTRepository {
    
    let api = NFTAPI()
    
    func getNFTs() async -> [NFT] {
        
        let result = await api.getNFTs()
        return mapResponeToDomain(model: result)
    }
    
    private func mapResponeToDomain(model:[NFTEntity]) -> [NFT] {
        
        var nft: [NFT] = []
        for item in model {
            nft.append(.init(entity: item))
        }
        return nft
    }
}
