//
//  DashBoardViewModel.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 19/11/24.
//

import Foundation

class DashBoardViewModel {
    
    var nfts = Observable<[NFT]>(value: [])
    
    weak var viewController: DashBoardViewController?
    
    var favList = Observable<[NFT]>(value: [])
    
    func didTapFavButton(model: NFT) {
        if self.favList.value.contains(where: { $0.id == model.id }) {
            self.favList.value.removeAll(where:  { $0.id == model.id })
        } else {
            self.favList.value.append(model)
        }

        self.viewController?.setUpFavList(favList: self.favList.value)
        
        for (index, nft) in nfts.value.enumerated() {
            if nft.id == model.id {
                self.nfts.value[index].isFavorite = model.isFavorite
            }
        }
    }
}
