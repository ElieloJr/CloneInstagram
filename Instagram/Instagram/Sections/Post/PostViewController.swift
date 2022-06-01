//
//  PostViewController.swift
//  Instagram
//
//  Created by Usr_Prime on 01/06/22.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors().defautBackground
        
        navigationItem.title = Titles().postTitle
        self.navigationController?.navigationBar.titleTextAttributes = Titles().feedFont
    }
}
