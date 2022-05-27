//
//  ActivityViewController.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit

class ActivityViewController: UIViewController {
    
    private lazy var activityTableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.register(ActivityTableViewCell.self, forCellReuseIdentifier: ActivityTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    private func setupView() {
        view.backgroundColor = Colors().defautBackground
        
        navigationItem.title = Titles().activityTitle
        self.navigationController?.navigationBar.titleTextAttributes = Titles().defaultFont
        
        activityTableView.delegate = self
        activityTableView.dataSource = self
        
        view.addSubview(activityTableView)
        
        activityTableView.frame = view.bounds
    }
}

extension ActivityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/9
    }
}

extension ActivityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ActivityTableViewCell.identifier, for: indexPath) as? ActivityTableViewCell else { return UITableViewCell() }
        return cell
    }
}
