//
//  PerfilViewController.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit

class PerfilViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors().defautBackground
        
        navigationItem.title = Titles().userName("nomeDoUser")
        self.navigationController?.navigationBar.titleTextAttributes = Titles().defaultFont
    }
}
