//
//  SearchTableView + Data Source.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 20/11/24.
//

import Foundation
import UIKit

extension SearchTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = self.data else { return 0 }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let nfts = self.data else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavListTableViewCellIdentifier", for: indexPath) as? FavListTableViewCell
            let nft = nfts[indexPath.row]
        cell?.selectionStyle = .none
        cell?.backgroundColor = .black
        cell?.imageCustomView.setUp(imageUrl: nft.imageUrl)
        cell?.informationCustomView.setUp(model: nft)
        return cell ?? UITableViewCell()
    }
}
