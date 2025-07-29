//
//  FavListTableView+Delegate.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 13/11/24.
//

import Foundation

import UIKit

extension FavListTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            guard let headerView = Bundle.main.loadNibNamed("SectionCellHeaderView", owner: self, options: nil)?.first as? SectionCellHeaderView else {
                return nil
            }
            headerView.titleLabel.text = "Favorite List"
            headerView.backgroundColor = .black
            return headerView
        default:
            return nil
        }
    }
}
