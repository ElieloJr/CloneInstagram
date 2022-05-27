//
//  FeedViewController.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit

class FeedViewController: UIViewController {

    lazy var feedTableView: UITableView = {
        let tableView = UITableView()
        let headerTable = StatusHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width/4))
        tableView.tableHeaderView = headerTable
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = Colors().defautBackground
        
        navigationItem.title = Titles().feedTitle
        self.navigationController?.navigationBar.titleTextAttributes = Titles().feedFont
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
        
        view.addSubview(feedTableView)
    }
    
    func setupConstraints() {
        feedTableView.frame = view.bounds
    }
}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/1.8
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        return cell
    }
    
}
