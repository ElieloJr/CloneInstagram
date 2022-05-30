//
//  ResultsViewController.swift
//  Instagram
//
//  Created by Usr_Prime on 30/05/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Pesquisar usuário"
        searchController.searchBar.searchBarStyle = .minimal
        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors().defautBackground
        
        navigationItem.searchController = searchController
    }
}
