//
//  MoreDetailsTableView+Delegate.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 4/11/24.
//

import Foundation
import UIKit

extension MoreDetailsTableView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
