//
//  ToMeetCollectionViewCell.swift
//  Instagram
//
//  Created by Usr_Prime on 25/05/22.
//

import UIKit

class ToMeetCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ToMeetCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
