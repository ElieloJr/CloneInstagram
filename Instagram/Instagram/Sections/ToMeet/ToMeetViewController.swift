//
//  ToMeetViewController.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit

class ToMeetViewController: UIViewController {
    
    private lazy var toMeetCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.width/3) - 6.7, height: (view.frame.width/3)-10)
        
        let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVIew.register(ToMeetCollectionViewCell.self, forCellWithReuseIdentifier: ToMeetCollectionViewCell.identifier)
        collectionVIew.showsVerticalScrollIndicator = false
        return collectionVIew
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = Colors().defautBackground
        
        navigationItem.title = Titles().toMeetTitle
        self.navigationController?.navigationBar.titleTextAttributes = Titles().defaultFont
        
        toMeetCollectionView.delegate = self
        toMeetCollectionView.dataSource = self
        toMeetCollectionView.frame = view.bounds
        
        view.addSubview(toMeetCollectionView)
    }
}

extension ToMeetViewController: UICollectionViewDelegate {
    
}

extension ToMeetViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToMeetCollectionViewCell.identifier, for: indexPath) as? ToMeetCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
