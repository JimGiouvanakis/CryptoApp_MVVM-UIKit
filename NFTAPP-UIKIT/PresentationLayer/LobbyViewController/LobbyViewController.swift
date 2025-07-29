//
//  LobbyViewController.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 13/11/24.
//

import UIKit

class LobbyViewController: UIViewController {
    
    var viewModel = LobbyViewModel()
    
    var flowCoordinator = LobbyFlowCoordinator()
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet var customView: UIView! {
        didSet {
            self.customView.backgroundColor = .black
        }
    }
    
    @IBOutlet weak var headerView: HeaderView! {
        didSet {
            self.headerView.backgroundColor = .black
            self.headerView.headerViewDelegate = self
        }
    }
    
    @IBOutlet weak var tabView: TabView! {
        didSet {
            self.tabView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        self.flowCoordinator.viewController = self
        
        Task { await setup() }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setup() async {
        await viewModel.getData()
        didTapHomeButton()
    }
}

extension LobbyViewController: DashBoardViewControllerProtocol {
    func setUpFavList(favList: [NFT]) {
        self.viewModel.favList.value = favList
    }
}

extension LobbyViewController: TabViewProtocol {
    func didTapHomeButton() {
        
        if let currentChild = children.first {
            currentChild.willMove(toParent: nil)
            currentChild.view.removeFromSuperview()
            currentChild.removeFromParent()
        }
        
        let storyboard = UIStoryboard(name: "DashBoardViewController", bundle: nil)
        guard let dashBoardViewController = storyboard.instantiateViewController(withIdentifier: "DashBoardViewController") as? DashBoardViewController else { return }
        
        dashBoardViewController.dashBoarddelegate = self
        
        dashBoardViewController.viewModel.nfts = self.viewModel.nfts
        
        dashBoardViewController.viewModel.favList.value = self.viewModel.nfts.value.filter({$0.isFavorite == true})
        
        dashBoardViewController.title = "Home"
        
        addChild(dashBoardViewController)
        
        containerView.addSubview(dashBoardViewController.view)
        
        dashBoardViewController.didMove(toParent: self)
    }
    
    func didTapSearchButton() {
        
        if let currentChild = children.first {
            currentChild.willMove(toParent: nil)
            currentChild.view.removeFromSuperview()
            currentChild.removeFromParent()
        }
        
        let searchStoryboard = UIStoryboard(name: "SearchViewController", bundle: nil)
        guard let searchViewBoard = searchStoryboard.instantiateViewController(withIdentifier: "SearchViewController") as?
                SearchViewController else { return }
        searchViewBoard.title = "Search"
        searchViewBoard.nfts = self.viewModel.nfts.value
        addChild(searchViewBoard)
        containerView.addSubview(searchViewBoard.view)
        
        searchViewBoard.didMove(toParent: self)
    }
    
    func didTapFavoriteButton() {
        
        if let currentChild = children.first {
            currentChild.willMove(toParent: nil)
            currentChild.view.removeFromSuperview()
            currentChild.removeFromParent()
        }
        
        if AppViewModel.shared.isUserLoggedIn.value != .loggedOut {
            
            let favStoryboard = UIStoryboard(name: "FavListViewController", bundle: nil)
            guard let favViewBoard = favStoryboard.instantiateViewController(withIdentifier: "FavListViewControllerIdentifier") as?
                    FavListViewController else { return }
            favViewBoard.title = "Fav"
            favViewBoard.model = viewModel.favList.value
            addChild(favViewBoard)
            containerView.addSubview(favViewBoard.view)
            
            favViewBoard.didMove(toParent: self)
        } else {
            
            let favEmptyStoryboard = UIStoryboard(name: "FavListEmptyViewController", bundle: nil)
            guard let favEmptyViewBoard = favEmptyStoryboard.instantiateViewController(withIdentifier: "FavListEmptyViewController") as?
            FavListEmptyViewController else { return }
            favEmptyViewBoard.title = "FavEmpty"
            addChild(favEmptyViewBoard)
            containerView.addSubview(favEmptyViewBoard.view)
            
            favEmptyViewBoard.didMove(toParent: self)
        }
    }
    
    func didTapSettingsButton() {
        
        if let currentChild = children.first {
            currentChild.willMove(toParent: nil)
            currentChild.view.removeFromSuperview()
            currentChild.removeFromParent()
        }
        
        let settingsStoryboard = UIStoryboard(name: "SettingsViewController", bundle: nil)
        guard let settingsViewBoard = settingsStoryboard.instantiateViewController(withIdentifier: "SettingsViewController") as?
                SettingsViewController else { return }
        settingsViewBoard.title = "Settings"
        addChild(settingsViewBoard)
        containerView.addSubview(settingsViewBoard.view)
        
        settingsViewBoard.didMove(toParent: self)
    }
}


extension LobbyViewController: HeaderViewProtocol {
    func didTapFavButton() {
        self.flowCoordinator.openFavListSheet(nfts: viewModel.favList.value)
    }
}

