//
//  FavListTableView+DataSource.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 5/11/24.
//

import Foundation
import UIKit

extension FavListTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nfts = self.data
        if nfts.isEmpty {
            return UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavListTableViewCellIdentifier", for: indexPath) as? FavListTableViewCell
            let nft = nfts[indexPath.row]
            cell?.selectionStyle = .none
            cell?.imageCustomView.setUp(imageUrl: nft.imageUrl)
            cell?.informationCustomView.setUp(model: nft)
            return cell ?? UITableViewCell()
        }
    }
}
