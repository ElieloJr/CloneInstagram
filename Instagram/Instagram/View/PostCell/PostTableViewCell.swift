//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Usr_Prime on 24/05/22.
//

import UIKit
import SDWebImage

class PostTableViewCell: UITableViewCell {

    static let identifier = "PostTableViewCell"
    var numberDefaultOfLikes = 0
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 0.50)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
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
        label.text = "A descrição vem aqui"
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
        separatorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        separatorView.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        pictureUserView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 7).isActive = true
        pictureUserView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7).isActive = true
        pictureUserView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pictureUserView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        userNameLabel.centerYAnchor.constraint(equalTo: pictureUserView.centerYAnchor).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: pictureUserView.trailingAnchor, constant: 10).isActive = true
        userNameLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.height/3) * 2).isActive = true
        
        postImageView.topAnchor.constraint(equalTo: pictureUserView.bottomAnchor, constant: 6).isActive = true
        postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        postImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        postImageView.heightAnchor.constraint(equalToConstant: (contentView.frame.height/4) * 2.6).isActive = true
        
        bigHeartOfDoubleClick.centerYAnchor.constraint(equalTo: postImageView.centerYAnchor).isActive = true
        bigHeartOfDoubleClick.centerXAnchor.constraint(equalTo: postImageView.centerXAnchor).isActive = true
        bigHeartOfDoubleClick.widthAnchor.constraint(equalToConstant: contentView.frame.width/3).isActive = true
        bigHeartOfDoubleClick.heightAnchor.constraint(equalToConstant: (contentView.frame.width/4) * 1.1).isActive = true
        
        likeButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 6).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        commentaryButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        commentaryButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10).isActive = true
        commentaryButton.widthAnchor.constraint(equalToConstant: 34).isActive = true
        commentaryButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        sendButton.centerYAnchor.constraint(equalTo: commentaryButton.centerYAnchor).isActive = true
        sendButton.leadingAnchor.constraint(equalTo: commentaryButton.trailingAnchor, constant: 10).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        numberOfLikesLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 6).isActive = true
        numberOfLikesLabel.leadingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: 6).isActive = true
        
        likeLabel.centerYAnchor.constraint(equalTo: numberOfLikesLabel.centerYAnchor).isActive = true
        likeLabel.leadingAnchor.constraint(equalTo: numberOfLikesLabel.trailingAnchor, constant: 4).isActive = true
        
        secondUserNameLabel.topAnchor.constraint(equalTo: numberOfLikesLabel.bottomAnchor, constant: 2).isActive = true
        secondUserNameLabel.leadingAnchor.constraint(equalTo: numberOfLikesLabel.leadingAnchor).isActive = true
       
        descriptionLabel.topAnchor.constraint(equalTo: secondUserNameLabel.topAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: secondUserNameLabel.trailingAnchor, constant: 4).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: -10).isActive = true
        
    }
    
    @objc func addLike(button: UIButton) {
        if likeButton.tintColor == .red {
            likeButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = .label
            numberDefaultOfLikes -= 1
            numberOfLikesLabel.text = "\(numberDefaultOfLikes)"
        } else {
            likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = .red
            numberDefaultOfLikes += 1
            numberOfLikesLabel.text = "\(numberDefaultOfLikes)"
        }
    }
    
    @objc func addCommentary() {
        print("Add Commentary")
    }
    
    @objc func sendPost() {
        print("Send this post")
    }
    
    @objc func likeWithDoubleClick() {
        if likeButton.tintColor != .red {
            numberDefaultOfLikes += 1
            numberOfLikesLabel.text = "\(numberDefaultOfLikes)"
        }
        
        bigHeartOfDoubleClick.isHidden = false
        likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        likeButton.tintColor = .red
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.bigHeartOfDoubleClick.isHidden = true
        }
    }
    
    func setupPost(post: PostAPIResponse) {
        pictureUserImageView.sd_setImage(with: URL(string: post.user.profile_image.small), completed: nil)
        postImageView.sd_setImage(with: URL(string: post.urls.regular), completed: nil)
        
        userNameLabel.text = post.user.username
        secondUserNameLabel.text = post.user.username
        
        numberOfLikesLabel.text = "\(post.likes)"
        numberDefaultOfLikes = post.likes
        descriptionLabel.text = post.description ?? ""
    }
}
