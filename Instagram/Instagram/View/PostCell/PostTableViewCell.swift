//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Usr_Prime on 24/05/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    static let identifier = "PostTableViewCell"
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 0.50)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var pictureUserImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
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
        
        let pictureUserImageViewConstraints = [
            pictureUserImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 7),
            pictureUserImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            pictureUserImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            pictureUserImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -7)
        ]
        NSLayoutConstraint.activate(pictureUserImageViewConstraints)
        
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(likeWithDoubleClick))
        doubleTap.numberOfTouchesRequired = 1
        doubleTap.numberOfTapsRequired = 2
        
        imageView.addGestureRecognizer(doubleTap)
        return imageView
    }()
    
    private lazy var bigHeartOfDoubleClick: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .red
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addLike), for: .touchUpInside)
        return button
    }()
    
    private lazy var commentaryButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addCommentary), for: .touchUpInside)
        return button
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(sendPost), for: .touchUpInside)
        return button
    }()
    
    private lazy var numberOfLikesLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.text = "curtidas"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondUserNameLabel: UILabel = {
        let label = UILabel()
        label.text = "NomeUsuário"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "                          A descrição vem aqui"
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.font = label.font.withSize(15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        
        addSubview(separatorView)
        addSubview(pictureUserView)
        addSubview(userNameLabel)
        
        addSubview(postImageView)
        addSubview(bigHeartOfDoubleClick)
        
        addSubview(likeButton)
        addSubview(commentaryButton)
        addSubview(sendButton)
        
        addSubview(numberOfLikesLabel)
        addSubview(likeLabel)
        
        addSubview(secondUserNameLabel)
        addSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let separatorViewConstraints = [
            separatorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.widthAnchor.constraint(equalToConstant: contentView.frame.width),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ]
        let pictureUserViewConstraints = [
            pictureUserView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 7),
            pictureUserView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            pictureUserView.widthAnchor.constraint(equalToConstant: 50),
            pictureUserView.heightAnchor.constraint(equalToConstant: 50)
        ]
        let userNameLabelConstraints = [
            userNameLabel.centerYAnchor.constraint(equalTo: pictureUserView.centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: pictureUserView.trailingAnchor, constant: 10),
            userNameLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.height/3) * 2)
        ]
        let postImageViewConstraints = [
            postImageView.topAnchor.constraint(equalTo: pictureUserView.bottomAnchor, constant: 6),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width),
            postImageView.heightAnchor.constraint(equalToConstant: (contentView.frame.height/4) * 2.6)
        ]
        let bigHeartOfDoubleClickConstraints = [
            bigHeartOfDoubleClick.centerYAnchor.constraint(equalTo: postImageView.centerYAnchor),
            bigHeartOfDoubleClick.centerXAnchor.constraint(equalTo: postImageView.centerXAnchor),
            bigHeartOfDoubleClick.widthAnchor.constraint(equalToConstant: contentView.frame.width/3),
            bigHeartOfDoubleClick.heightAnchor.constraint(equalToConstant: (contentView.frame.width/4) * 1.1)
        ]
        let likeButtonConstraints = [
            likeButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 6),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            likeButton.widthAnchor.constraint(equalToConstant: 40),
            likeButton.heightAnchor.constraint(equalToConstant: 36)
        ]
        let comentaryButtonConstraints = [
            commentaryButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            commentaryButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10),
            commentaryButton.widthAnchor.constraint(equalToConstant: 34),
            commentaryButton.heightAnchor.constraint(equalToConstant: 34)
        ]
        let sendButtonConstraints = [
            sendButton.centerYAnchor.constraint(equalTo: commentaryButton.centerYAnchor),
            sendButton.leadingAnchor.constraint(equalTo: commentaryButton.trailingAnchor, constant: 10),
            sendButton.widthAnchor.constraint(equalToConstant: 36),
            sendButton.heightAnchor.constraint(equalToConstant: 34)
        ]
        let numberOfLikesLabelConstraints = [
            numberOfLikesLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 6),
            numberOfLikesLabel.leadingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: 6)
        ]
        let likeLabelConstraints = [
            likeLabel.centerYAnchor.constraint(equalTo: numberOfLikesLabel.centerYAnchor),
            likeLabel.leadingAnchor.constraint(equalTo: numberOfLikesLabel.trailingAnchor, constant: 4)
        ]
        let secondUserNameLabelConstraints = [
            secondUserNameLabel.topAnchor.constraint(equalTo: numberOfLikesLabel.bottomAnchor, constant: 2),
            secondUserNameLabel.leadingAnchor.constraint(equalTo: numberOfLikesLabel.leadingAnchor)
        ]
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: secondUserNameLabel.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: secondUserNameLabel.leadingAnchor),
            descriptionLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width/3)*2.8)
        ]
        
        NSLayoutConstraint.activate(separatorViewConstraints)
        NSLayoutConstraint.activate(pictureUserViewConstraints)
        NSLayoutConstraint.activate(userNameLabelConstraints)
        
        NSLayoutConstraint.activate(postImageViewConstraints)
        NSLayoutConstraint.activate(bigHeartOfDoubleClickConstraints)
        
        NSLayoutConstraint.activate(likeButtonConstraints)
        NSLayoutConstraint.activate(comentaryButtonConstraints)
        NSLayoutConstraint.activate(sendButtonConstraints)
        
        NSLayoutConstraint.activate(numberOfLikesLabelConstraints)
        NSLayoutConstraint.activate(likeLabelConstraints)
        
        NSLayoutConstraint.activate(secondUserNameLabelConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
    }
    
    @objc func addLike(button: UIButton) {
        if likeButton.tintColor == .red {
            likeButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = .label
            numberOfLikesLabel.text = "0"
        } else {
            likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = .red
            numberOfLikesLabel.text = "1"
        }
    }
    
    @objc func addCommentary() {
        print("Add Commentary")
    }
    
    @objc func sendPost() {
        print("Send this post")
    }
    
    @objc func likeWithDoubleClick() {
        bigHeartOfDoubleClick.isHidden = false
        likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        likeButton.tintColor = .red
        numberOfLikesLabel.text = "1"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.bigHeartOfDoubleClick.isHidden = true
        }
    }
    
    func setupPost(perfil: UIImage, post: UIImage, userName: String, numLikes: String, description: String) {
        pictureUserImageView.image = perfil
        postImageView.image = post
        
        userNameLabel.text = userName
        secondUserNameLabel.text = userName
        
        numberOfLikesLabel.text = numLikes
        descriptionLabel.text = "                      " + description
    }
}
