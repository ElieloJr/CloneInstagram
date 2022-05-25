//
//  ActivityViewController.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit

class ActivityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors().defautBackground
        
        navigationItem.title = Titles().activityTitle
        self.navigationController?.navigationBar.titleTextAttributes = Titles().defaultFont
    }

}
