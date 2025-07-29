//
//  SearchTableView + Delegate.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 20/11/24.
//

import Foundation
import UIKit

extension SearchTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
