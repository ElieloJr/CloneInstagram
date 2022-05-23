//
//  FeedViewController.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = Colors().defautBackground
        
        navigationItem.title = Titles().feedTitle
        self.navigationController?.navigationBar.titleTextAttributes = Titles().feedFont
    }
}
