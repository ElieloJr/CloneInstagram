//
//  ToMeetViewController.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit
import SDWebImage

class ToMeetViewController: UIViewController {
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: ResultsViewController())
        searchController.searchBar.placeholder = "Pesquisar usuário"
        searchController.searchBar.searchBarStyle = .minimal
        return searchController
    }()
    
    private lazy var toMeetCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.width/3) - 1, height: (view.frame.width/3)-10)
        
        let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVIew.register(SmallPostCollectionViewCell.self, forCellWithReuseIdentifier: SmallPostCollectionViewCell.identifier)
        collectionVIew.showsVerticalScrollIndicator = false
        return collectionVIew
    }()
    
    private lazy var blurView: UIView = {
        let view = UIView()
        view.backgroundColor = .label
        view.layer.opacity = 0.2
        view.isHidden = true
        return view
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
        
        pictureUserImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 4).isActive = true
        pictureUserImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4).isActive = true
        pictureUserImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4).isActive = true
        pictureUserImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -4).isActive = true
        
        return view
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
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
        
        pictureUserView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        pictureUserView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        pictureUserView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        pictureUserView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
        userNameLabel.centerYAnchor.constraint(equalTo: pictureUserView.centerYAnchor).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: pictureUserView.trailingAnchor, constant: 10).isActive = true
            
        postImageView.topAnchor.constraint(equalTo: pictureUserView.bottomAnchor, constant: 6).isActive = true
        postImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        postImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        return view
    }()

    let viewModel = ToMeetViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        viewModel.getPosts()
    }
    
    private func setupView() {
        view.backgroundColor = Colors().defautBackground
        
        navigationItem.title = Titles().toMeetTitle
        self.navigationController?.navigationBar.titleTextAttributes = Titles().defaultFont
        navigationItem.searchController = searchController
        
        toMeetCollectionView.delegate = self
        toMeetCollectionView.dataSource = self
        viewModel.delegate = self
        
        view.addSubview(toMeetCollectionView)
        view.addSubview(blurView)
        view.addSubview(postView)
    }
    
    private func setupConstraints() {
        toMeetCollectionView.frame = view.bounds
        
        postView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        postView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        postView.widthAnchor.constraint(equalToConstant: (view.frame.width/2) * 1.8).isActive = true
        postView.heightAnchor.constraint(equalToConstant: (view.frame.width/6) * 5).isActive = true
        
        blurView.frame = view.bounds
    }
}

extension ToMeetViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let postController = PostViewController()
        postController.navigationItem.title = Titles().toMeetTitle
        postController.setupScreen(with: viewModel.posts[indexPath.row])
        
        let rootController = UINavigationController(rootViewController: postController)
        rootController.modalPresentationStyle = .fullScreen
        present(rootController, animated: true)
    }
}

extension ToMeetViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallPostCollectionViewCell.identifier, for: indexPath) as? SmallPostCollectionViewCell else { return UICollectionViewCell() }
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(zoomInThePost))
        cell.addGestureRecognizer(longPress)
        cell.configureCell(with: viewModel.posts[indexPath.row].urls.regular)
        return cell
    }
}

extension ToMeetViewController {
    @objc func zoomInThePost(_ gesture: UIGestureRecognizer) {
        
        switch(gesture.state) {
        case .began:
            guard let selectedCell = toMeetCollectionView.indexPathForItem(at: gesture.location(in: toMeetCollectionView))
            else { return }
            let post = viewModel.posts[selectedCell.row]
            
            pictureUserImageView.sd_setImage(with: URL(string: post.user.profile_image.large), completed: nil)
            userNameLabel.text = post.user.username
            postImageView.sd_setImage(with: URL(string: post.urls.regular), completed: nil)
            
            blurView.isHidden = false
            postView.isHidden = false
            
        case .ended:
            blurView.isHidden = true
            postView.isHidden = true
            
        case .possible, .changed, .cancelled, .failed: break
        @unknown default: break
        }
    }
}

extension ToMeetViewController: ToMeetViewDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.toMeetCollectionView.reloadData()
        }
    }
}
