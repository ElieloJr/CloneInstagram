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
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .label
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(addLike), for: .touchUpInside)
        return button
    }()
    
    private lazy var commentaryButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .label
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(addCommentary), for: .touchUpInside)
        return button
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(sendPost), for: .touchUpInside)
        return button
    }()
    
    private lazy var actionsStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalCentering
        stack.axis = .horizontal
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(likeButton)
        stack.addArrangedSubview(commentaryButton)
        stack.addArrangedSubview(sendButton)
        
        likeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        commentaryButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        commentaryButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        sendButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        return stack
    }()
    
    private lazy var numberOfLikesLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.text = "curtidas"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondUserNameLabel: UILabel = {
        let label = UILabel()
        label.text = "NomeUsuário"
        label.font = UIFont.boldSystemFont(ofSize: 17)
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
        
        self.navigationController?.navigationBar.titleTextAttributes = Titles().feedFont
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        view.addSubview(pictureUserView)
        view.addSubview(userNameLabel)
        
        view.addSubview(postImageView)
        view.addSubview(actionsStack)
        
        view.addSubview(numberOfLikesLabel)
        view.addSubview(likeLabel)
        
        view.addSubview(secondUserNameLabel)
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
        postImageView.heightAnchor.constraint(equalToConstant: (view.frame.height/4) * 1.8).isActive = true
        
        actionsStack.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 4).isActive = true
        actionsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        actionsStack.widthAnchor.constraint(equalToConstant: (view.frame.width/2) * 0.65).isActive = true
        actionsStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        numberOfLikesLabel.topAnchor.constraint(equalTo: actionsStack.bottomAnchor, constant: 4).isActive = true
        numberOfLikesLabel.leftAnchor.constraint(equalTo: actionsStack.leftAnchor).isActive = true
        
        likeLabel.centerYAnchor.constraint(equalTo: numberOfLikesLabel.centerYAnchor).isActive = true
        likeLabel.leadingAnchor.constraint(equalTo: numberOfLikesLabel.trailingAnchor, constant: 4).isActive = true
        
        secondUserNameLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 4).isActive = true
        secondUserNameLabel.leadingAnchor.constraint(equalTo: numberOfLikesLabel.leadingAnchor).isActive = true
    }
    
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }
}
