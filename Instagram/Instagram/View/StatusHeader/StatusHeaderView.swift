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
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PictureCollectionViewCell.self, forCellWithReuseIdentifier: PictureCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let viewModel = FeedViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        viewModel.statusDelegate = self
        print(viewModel.posts)
        status = viewModel.posts
        viewModel.getStatus()
        
        statusCollectionVIew.delegate = self
        statusCollectionVIew.dataSource = self
        
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
        cell.configureCell(with: status[indexPath.row].user.profile_image.large)
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
