//
//  UseCase.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 22/10/24.
//

import Foundation

struct GetNFTUseCase {
    
    let repository = NFTRepository()
    
    func execute() async -> [NFT] {
        let nfts = await repository.getNFTs()
        return nfts
    }
}
