//
//  BaseTableView+DataSource.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 22/10/24.
//

import UIKit

extension BaseTableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch data?[section] {
        case .newSearch:
            return 1
        case .topSearch:
            return 1
        case .nfts(let nfts):
            return nfts.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch self.data?[indexPath.section] {
        case .newSearch(let nfts):
            let newSearchList = nfts.filter({$0.numberOwners < 1000 })
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewSearchCellIdentifier", for: indexPath) as? NewSearchCell
            cell?.selectionStyle = .none
            cell?.backgroundColor = .black
            cell?.setUp(model: newSearchList)
            return cell ?? UITableViewCell()
        case .topSearch(let nfts):
            let topSearchList = nfts.filter({$0.floorPrice.amount > "1.5" })
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopSearchCellIdentifier", for: indexPath) as? TopSearchCell
            cell?.selectionStyle = .none
            cell?.backgroundColor = .black
            cell?.setUp(model: topSearchList, delegate: self)
            return cell ?? UITableViewCell()
        case .nfts(let nfts):
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainSearchTableViewCellIdentifier", for: indexPath) as? MainSearchTableViewCell
            let nft = nfts[indexPath.row]
            cell?.selectionStyle = .none
            cell?.backgroundColor = .black
            cell?.setUp2(model: nft, delegate: self)
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}
