//
//  PictureCollectionViewCell.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    private lazy var posterImageView: UIView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 45
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var posterView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        
        view.addSubview(posterImageView)
        
        let posterImageViewConstraints = [
            posterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 7),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            posterImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -7)
        ]
        NSLayoutConstraint.activate(posterImageViewConstraints)
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterView)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
