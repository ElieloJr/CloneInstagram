//
//  PostViewController.swift
//  Instagram
//
//  Created by Usr_Prime on 01/06/22.
//

import UIKit

class PostViewController: UIViewController {
    
    lazy var leftButton: UIButton = {
        let leftButton: UIButton = UIButton()
        leftButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        leftButton.tintColor = .label
        leftButton.contentVerticalAlignment = .fill
        leftButton.contentHorizontalAlignment = .fill
        leftButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftButton.widthAnchor.constraint(equalToConstant: 35),
            leftButton.heightAnchor.constraint(equalToConstant: (((navigationController?.navigationBar.frame.height)!)/2)*1.3)
        ])
        
        return leftButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = Colors().defautBackground
        
        navigationItem.title = Titles().postTitle
        self.navigationController?.navigationBar.titleTextAttributes = Titles().feedFont
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
    }
    
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }
}
