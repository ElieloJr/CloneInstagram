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
        searchController.searchBar.searchBarStyle = .minimal
        return searchController
    }()
    
    private lazy var resultsTableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = Colors().defautBackground
        navigationItem.searchController = searchController
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        
        view.addSubview(resultsTableView)
    }
    
    private func setupConstraints() {
        resultsTableView.frame = view.bounds
    }
}

extension ResultsViewController: UITableViewDelegate {
    
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
