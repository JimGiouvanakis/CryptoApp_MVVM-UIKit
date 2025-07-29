//
//  BaseTableView+Delegate.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 23/10/24.
//

import Foundation
import UIKit

extension BaseTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch self.data?[indexPath.section] {
        case .newSearch:
            return 150
        case .topSearch:
            return 270
        case .nfts:
            return 400
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch self.data?[section] {
        case .topSearch:
            guard let headerView = Bundle.main.loadNibNamed("SectionCellHeaderView", owner: self, options: nil)?.first as? SectionCellHeaderView else {
                return nil
            }
            headerView.titleLabel.text = "Top Search"
            headerView.backgroundColor = .black
            return headerView
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            UITableView.automaticDimension
        default:
            0
        }
    }
}
