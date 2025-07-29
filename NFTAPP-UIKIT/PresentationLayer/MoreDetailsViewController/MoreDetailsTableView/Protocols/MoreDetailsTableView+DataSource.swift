//
//  MoreDetailsTableView+DataSource.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 4/11/24.
//

import Foundation
import UIKit

extension MoreDetailsTableView : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreDetailsTableViewCellIdentifier", for: indexPath) as? MoreDetailsTableViewCell
        if let nft = self.data {
            cell?.selectionStyle = .none
            cell?.nftNameTitle.text = nft.name
            cell?.imageCustomView.setUp(imageUrl: nft.imageUrl)
            cell?.moreInfoView.setUpmoreInfo(model: nft)
        }
        return cell ?? UITableViewCell()
    }
}
