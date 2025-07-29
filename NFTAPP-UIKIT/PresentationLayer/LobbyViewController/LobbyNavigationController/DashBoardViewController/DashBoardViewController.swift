//
//  DashBoardViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 18/11/24.
//

import UIKit

protocol DashBoardViewControllerProtocol: AnyObject {
    func setUpFavList(favList: [NFT])
}

class DashBoardViewController: UIViewController {
    
    var viewModel = DashBoardViewModel()
    
    var flowCoordinator = DashBoardFlowCoordinator()
    
    weak var dashBoarddelegate: DashBoardViewControllerProtocol?
    
    @IBOutlet weak var baseTableView: BaseTableView! {
        didSet {
            self.baseTableView.baseTableViewDelegate = self
            self.baseTableView.backgroundColor = .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task { await setUpTableView() }
        self.flowCoordinator.viewController = self
        self.viewModel.viewController = self
        registerObservers()
    }
    
    private func registerObservers() {
        viewModel.nfts.addObserver { [weak self] value in
            if var data = self?.baseTableView.data, case var .nfts(nftsArray) = data[2] {
                nftsArray = value
                data[2] = .nfts(nftsArray)
                
                self?.baseTableView.data = data
            }
        }
    }
    
    func setUpFavList(favList: [NFT]) {
        self.dashBoarddelegate?.setUpFavList(favList: favList)
    }
    
    private func setUpTableView() async {
        self.baseTableView.data = [.newSearch(viewModel.nfts.value), .topSearch(viewModel.nfts.value), .nfts(viewModel.nfts.value)]
    }
}

extension DashBoardViewController: BaseTableViewProtocol {
    func didTapMoreDetails(model: NFT?) {
        self.flowCoordinator.openMoreDetailsSheet(model: model)
    }
    
    func didTapFavButton(model: NFT?) {
        if let model {
            self.viewModel.didTapFavButton(model: model)
        }
    }
    
    func topSearchItemTapped(model: NFT?) {
        self.flowCoordinator.pushMoreDetailsView(model: model)
    }
}
