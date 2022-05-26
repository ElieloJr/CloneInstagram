//
//  PerfilViewController.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit

class PerfilViewController: UIViewController {
    
    private lazy var pictureImageView: UIView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 65
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var pictureView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 70
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pictureImageView)
        
        let pictureImageViewConstraints = [
            pictureImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 7),
            pictureImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            pictureImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            pictureImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -7)
        ]
        
        NSLayoutConstraint.activate(pictureImageViewConstraints)
        return view
    }()
    
    private lazy var stackStatistics: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = Colors().defautBackground
        
        navigationItem.title = Titles().userName("nomeDoUser")
        self.navigationController?.navigationBar.titleTextAttributes = Titles().defaultFont
        
        view.addSubview(pictureView)
        view.addSubview(stackStatistics)
    }
    
    private func setupConstraints() {
        let pictureViewConstraints = [
            pictureView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            pictureView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            pictureView.widthAnchor.constraint(equalToConstant: view.frame.width/3),
            pictureView.heightAnchor.constraint(equalToConstant: view.frame.width/3)
        ]
        let stackStatisticsConstraints = [
            stackStatistics.centerYAnchor.constraint(equalTo: pictureView.centerYAnchor),
            stackStatistics.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor, constant: 4),
            stackStatistics.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            stackStatistics.heightAnchor.constraint(equalToConstant: view.frame.width/4)
        ]
        
        NSLayoutConstraint.activate(pictureViewConstraints)
        NSLayoutConstraint.activate(stackStatisticsConstraints)
    }
}
