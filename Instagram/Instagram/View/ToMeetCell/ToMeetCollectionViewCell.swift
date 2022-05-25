//
//  ToMeetCollectionViewCell.swift
//  Instagram
//
//  Created by Usr_Prime on 25/05/22.
//

import UIKit

class ToMeetCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ToMeetCollectionViewCell"
    
    private lazy var smallImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        smallImageView.frame = contentView.bounds
        
        addSubview(smallImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with post: UIImage) {
        smallImageView.image = post
    }
}
