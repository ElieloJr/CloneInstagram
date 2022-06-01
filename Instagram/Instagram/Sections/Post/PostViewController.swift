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
    
    private lazy var pictureUserImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 18
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var pictureUserView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pictureUserImageView)
        
        pictureUserImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 7).isActive = true
        pictureUserImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7).isActive = true
        pictureUserImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7).isActive = true
        pictureUserImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -7).isActive = true
        
        return view
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "NomeUsuário"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        
//        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(likeWithDoubleClick))
//        doubleTap.numberOfTouchesRequired = 1
//        doubleTap.numberOfTapsRequired = 2
//
//        imageView.addGestureRecognizer(doubleTap)
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = Colors().defautBackground
        
        self.navigationController?.navigationBar.titleTextAttributes = Titles().feedFont
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        view.addSubview(pictureUserView)
        view.addSubview(userNameLabel)
        
        view.addSubview(postImageView)
    }
    
    private func setupConstraints() {
        pictureUserView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        pictureUserView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        pictureUserView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pictureUserView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        userNameLabel.centerYAnchor.constraint(equalTo: pictureUserView.centerYAnchor).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: pictureUserView.trailingAnchor, constant: 10).isActive = true
        userNameLabel.widthAnchor.constraint(equalToConstant: (view.frame.height/3) * 2).isActive = true
        
        postImageView.topAnchor.constraint(equalTo: pictureUserView.bottomAnchor, constant: 10).isActive = true
        postImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        postImageView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        postImageView.heightAnchor.constraint(equalToConstant: (view.frame.height/4) * 2).isActive = true
    }
    
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }
}
