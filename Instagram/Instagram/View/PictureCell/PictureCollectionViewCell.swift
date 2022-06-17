//
//  PictureCollectionViewCell.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit
import SDWebImage

class PictureCollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 45
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var posterView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 200
        view.addSubview(posterImageView)
        
        posterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 7).isActive = true
        posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7).isActive = true
        posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7).isActive = true
        posterImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -7).isActive = true
        
        return view
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "username"
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(posterView)
        contentView.addSubview(usernameLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterView.frame = CGRect(x: 8, y: 2, width: 103, height: 103)
        Add.gradientBorder(with: posterView, border: 50)
        
        usernameLabel.topAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 2).isActive = true
        usernameLabel.centerXAnchor.constraint(equalTo: posterView.centerXAnchor).isActive = true
    }
    
    func configureCell(with url: String, and name: String) {
        posterImageView.sd_setImage(with: URL(string: url), completed: nil)
        usernameLabel.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
