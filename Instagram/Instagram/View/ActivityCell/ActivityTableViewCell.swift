//
//  ActivityTableViewCell.swift
//  Instagram
//
//  Created by Usr_Prime on 25/05/22.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    static let identifier = "ActivityTableViewCell"
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "nomeDoUser"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "                             que talvez conheça, está no Istagram"
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.font = label.font.withSize(15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Seguir", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = Colors().defaultBlue
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(setStatsOfFollow), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        
        addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(messageLabel)
        addSubview(followButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let userImageViewConstraints = [
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userImageView.widthAnchor.constraint(equalToConstant: (contentView.frame.width/4)),
            userImageView.heightAnchor.constraint(equalToConstant: (contentView.frame.width/4))
        ]
        let userNameLabelConstraints = [
            userNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor, constant: -10),
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10)
        ]
        let messageLabelConstraints = [
            messageLabel.topAnchor.constraint(equalTo: userNameLabel.topAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            messageLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width/3) * 2)
        ]
        let followButtonConstraints = [
            followButton.topAnchor.constraint(equalTo: messageLabel.topAnchor),
            followButton.leadingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 10),
            followButton.widthAnchor.constraint(equalToConstant: (contentView.frame.width/4) * 1.2),
            followButton.heightAnchor.constraint(equalToConstant: 35)
        ]
        
        NSLayoutConstraint.activate(userImageViewConstraints)
        NSLayoutConstraint.activate(userNameLabelConstraints)
        NSLayoutConstraint.activate(messageLabelConstraints)
        NSLayoutConstraint.activate(followButtonConstraints)
    }
    
    @objc func setStatsOfFollow() {
        if followButton.backgroundColor == Colors().defaultBlue {
            followButton.layer.borderColor = UIColor.darkGray.cgColor
            followButton.layer.borderWidth = 2
            followButton.backgroundColor = UIColor.systemBackground
            followButton.setTitle("Seguindo", for: .normal)
            followButton.setTitleColor(.label, for: .normal)
        } else {
            followButton.layer.borderWidth = 0
            followButton.backgroundColor = Colors().defaultBlue
            followButton.setTitle("Seguir", for: .normal)
            followButton.setTitleColor(.white, for: .normal)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
