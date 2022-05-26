//
//  ToMeetViewController.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit

class ToMeetViewController: UIViewController {
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Pesquisar usuário"
        searchController.searchBar.searchBarStyle = .minimal
        return searchController
    }()
    
    private lazy var toMeetCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.width/3) - 6.7, height: (view.frame.width/3)-10)
        
        let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVIew.register(ToMeetCollectionViewCell.self, forCellWithReuseIdentifier: ToMeetCollectionViewCell.identifier)
        collectionVIew.showsVerticalScrollIndicator = false
        return collectionVIew
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "NomeUsuário"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pictureUserImageView)
        
        let pictureUserImageViewConstraints = [
            pictureUserImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 4),
            pictureUserImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            pictureUserImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            pictureUserImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -4)
        ]
        NSLayoutConstraint.activate(pictureUserImageViewConstraints)
        
        return view
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var postView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.isHidden = true
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pictureUserView)
        view.addSubview(userNameLabel)
        view.addSubview(postImageView)
        
        let pictureUserViewConstraints = [
            pictureUserView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            pictureUserView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            pictureUserView.widthAnchor.constraint(equalToConstant: 40),
            pictureUserView.heightAnchor.constraint(equalToConstant: 40)
        ]
        let userNameLabelConstraints = [
            userNameLabel.centerYAnchor.constraint(equalTo: pictureUserView.centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: pictureUserView.trailingAnchor, constant: 10)
        ]
        let postImageViewConstraints = [
            postImageView.topAnchor.constraint(equalTo: pictureUserView.bottomAnchor, constant: 6),
            postImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(pictureUserViewConstraints)
        NSLayoutConstraint.activate(userNameLabelConstraints)
        NSLayoutConstraint.activate(postImageViewConstraints)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = Colors().defautBackground
        
        navigationItem.title = Titles().toMeetTitle
        self.navigationController?.navigationBar.titleTextAttributes = Titles().defaultFont
        navigationItem.searchController = searchController
        
        toMeetCollectionView.delegate = self
        toMeetCollectionView.dataSource = self
        
        view.addSubview(toMeetCollectionView)
        view.addSubview(postView)
    }
    
    private func setupConstraints() {
        toMeetCollectionView.frame = view.bounds
        
        let postViewConstraints = [
            postView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postView.widthAnchor.constraint(equalToConstant: (view.frame.width/2) * 1.8),
            postView.heightAnchor.constraint(equalToConstant: (view.frame.width/6) * 5)
        ]
        
        NSLayoutConstraint.activate(postViewConstraints)
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
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(zoomInThePost))
        cell.addGestureRecognizer(longPress)
        return cell
    }
}

extension ToMeetViewController {
    @objc func zoomInThePost(_ gesture: UIGestureRecognizer) {
        
        switch(gesture.state) {
        case .began:
            guard let selectedCell = toMeetCollectionView.indexPathForItem(at: gesture.location(in: toMeetCollectionView))
            else { return }
            print(selectedCell.row)
            // TODO: Colocar aqui a imagem
            postView.isHidden = false
            
        case .ended:
            postView.isHidden = true
            
        case .possible, .changed, .cancelled, .failed: break
        @unknown default: break
        }
    }
}
