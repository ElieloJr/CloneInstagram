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
    
    private lazy var numberPublicationsLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var publicationsLabel: UILabel = {
        let label = UILabel()
        label.text = "Publicações"
        label.font = label.font.withSize(14)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var publicationsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(numberPublicationsLabel)
        stack.addArrangedSubview(publicationsLabel)
        
        numberPublicationsLabel.topAnchor.constraint(equalTo: stack.topAnchor).isActive = true
        publicationsLabel.topAnchor.constraint(equalTo: numberPublicationsLabel.bottomAnchor).isActive = true
        return stack
    }()
    
    private lazy var numberFollowersLabel: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.text = "Seguidores"
        label.font = label.font.withSize(14)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followersStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(numberFollowersLabel)
        stack.addArrangedSubview(followersLabel)
        
        numberFollowersLabel.topAnchor.constraint(equalTo: stack.topAnchor).isActive = true
        followersLabel.topAnchor.constraint(equalTo: numberFollowersLabel.bottomAnchor).isActive = true
        return stack
    }()
    
    private lazy var numberFollowingLabel: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.text = "Seguindo"
        label.font = label.font.withSize(14)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followingStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(numberFollowingLabel)
        stack.addArrangedSubview(followingLabel)
        
        numberFollowingLabel.topAnchor.constraint(equalTo: stack.topAnchor).isActive = true
        followingLabel.topAnchor.constraint(equalTo: numberFollowingLabel.bottomAnchor).isActive = true
        return stack
    }()
    
    private lazy var stackStatistics: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalCentering
        stack.axis = .horizontal
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(publicationsStack)
        stack.addArrangedSubview(followersStack)
        stack.addArrangedSubview(followingStack)
        return stack
    }()

    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome Escolhido"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.addSubview(userNameLabel)
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
            stackStatistics.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor, constant: 14),
            stackStatistics.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackStatistics.heightAnchor.constraint(equalToConstant: view.frame.width/4)
        ]
        
        userNameLabel.topAnchor.constraint(equalTo: pictureView.bottomAnchor, constant: 10).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        NSLayoutConstraint.activate(pictureViewConstraints)
        NSLayoutConstraint.activate(stackStatisticsConstraints)
    }
}
