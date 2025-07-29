//
//  LobbyViewModel.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 22/10/24.
//

import UIKit

class LobbyViewModel {
    
    var nfts = Observable<[NFT]>(value: [])
    
    let getNFTUseCase = GetNFTUseCase()
    
    var favList = Observable<[NFT]>(value: [])
    
    func getData() async {
        
        let nfts = await getNFTUseCase.execute()
        self.nfts.value = nfts
    }
}

//extension LobbyViewModel:AppViewModelProtocol {
//    func logIn() {
//        print("logIn from lobby")
//    }
//    
//    func logOut() {
//        print("logOut from lobby")
//    }
//}
