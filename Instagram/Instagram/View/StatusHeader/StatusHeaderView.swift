//
//  StatusHeaderView.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit

class StatusHeaderView: UIView {
    
    var status: [PostAPIResponse] = []

    lazy var statusCollectionVIew: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 115, height: 125)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
//        layout.itemSize = CGSize(width: (view.frame.width/3) - 1, height: (view.frame.width/3)-10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PictureCollectionViewCell.self, forCellWithReuseIdentifier: PictureCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let viewModel = FeedViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewModel.getStatus()
        
        statusCollectionVIew.delegate = self
        statusCollectionVIew.dataSource = self
        viewModel.statusDelegate = self
        
        addSubview(statusCollectionVIew)
        
        statusCollectionVIew.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StatusHeaderView: UICollectionViewDelegate {
    
}

extension StatusHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return status.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCollectionViewCell.identifier, for: indexPath) as? PictureCollectionViewCell else { return UICollectionViewCell() }
        let cellStatus = status[indexPath.row].user
        cell.configureCell(with: cellStatus.profile_image.large, and: cellStatus.username)
        return cell
    }
}

extension StatusHeaderView: StatusHeaderDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.statusCollectionVIew.reloadData()
        }
    }
    func setStatus(with posts: [PostAPIResponse]) {
        status = posts.reversed()
    }
}
