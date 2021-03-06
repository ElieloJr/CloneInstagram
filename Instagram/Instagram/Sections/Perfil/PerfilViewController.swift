//
//  PerfilViewController.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit
import SDWebImage

class PerfilViewController: UIViewController {
    
    private lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 65
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var pictureView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 70
        
        view.addSubview(pictureImageView)
        
        pictureImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 7).isActive = true
        pictureImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7).isActive = true
        pictureImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7).isActive = true
        pictureImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -7).isActive = true
        
        return view
    }()
    
    private lazy var numberPublicationsLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var publicationsLabel: UILabel = {
        let label = UILabel()
        label.text = "Publicações"
        label.font = label.font.withSize(14)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var publicationsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(numberPublicationsLabel)
        stack.addArrangedSubview(publicationsLabel)
        
        numberPublicationsLabel.topAnchor.constraint(equalTo: stack.topAnchor).isActive = true
        publicationsLabel.topAnchor.constraint(equalTo: numberPublicationsLabel.bottomAnchor).isActive = true
        return stack
    }()
    
    private lazy var numberFollowersLabel: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.text = "Seguidores"
        label.font = label.font.withSize(14)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followersStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(numberFollowersLabel)
        stack.addArrangedSubview(followersLabel)
        
        numberFollowersLabel.topAnchor.constraint(equalTo: stack.topAnchor).isActive = true
        followersLabel.topAnchor.constraint(equalTo: numberFollowersLabel.bottomAnchor).isActive = true
        
        return stack
    }()
    
    private lazy var numberFollowingLabel: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.text = "Seguindo"
        label.font = label.font.withSize(14)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followingStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(numberFollowingLabel)
        stack.addArrangedSubview(followingLabel)
        
        numberFollowingLabel.topAnchor.constraint(equalTo: stack.topAnchor).isActive = true
        followingLabel.topAnchor.constraint(equalTo: numberFollowingLabel.bottomAnchor).isActive = true
        return stack
    }()
    
    private lazy var stackStatistics: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalCentering
        stack.axis = .horizontal
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(publicationsStack)
        stack.addArrangedSubview(followersStack)
        stack.addArrangedSubview(followingStack)
        return stack
    }()

    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome Escolhido"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.text = "Bio"
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleCollectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Publicações"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var publicationsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.width/3) - 1, height: (view.frame.width/3)-10)
        
        let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVIew.register(SmallPostCollectionViewCell.self, forCellWithReuseIdentifier: SmallPostCollectionViewCell.identifier)
        collectionVIew.showsVerticalScrollIndicator = false
        collectionVIew.translatesAutoresizingMaskIntoConstraints = false
        return collectionVIew
    }()
    
    private lazy var blurView: UIView = {
        let view = UIView()
        view.backgroundColor = .label
        view.layer.opacity = 0.2
        view.isHidden = true
        return view
    }()
    
    private lazy var zoomUserNameLabel: UILabel = {
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
        view.layer.cornerRadius = 20
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
        imageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var zoomPostView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.isHidden = true
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.label.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pictureUserView)
        view.addSubview(zoomUserNameLabel)
        view.addSubview(postImageView)
        
        pictureUserView.frame = CGRect(x: view.frame.minX+7,
                                       y: view.frame.minY+10,
                                       width: 40,
                                       height: 40)
        Add.gradientBorder(with: pictureUserView, border: 20)
        
        zoomUserNameLabel.centerYAnchor.constraint(equalTo: pictureUserView.centerYAnchor).isActive = true
        zoomUserNameLabel.leadingAnchor.constraint(equalTo: pictureUserView.trailingAnchor, constant: 10).isActive = true
            
        postImageView.topAnchor.constraint(equalTo: pictureUserView.bottomAnchor, constant: 6).isActive = true
        postImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        postImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        return view
    }()
    
    let viewModel = PerfilViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        viewModel.getPublications()
    }
    
    private func setupView() {
        view.backgroundColor = Colors.defautBackground
        
        navigationItem.title = Titles.userName("nomeDoUser")
        self.navigationController?.navigationBar.titleTextAttributes = Titles.defaultFont
        
        publicationsCollectionView.delegate = self
        publicationsCollectionView.dataSource = self
        viewModel.delegate = self
        
        view.addSubview(pictureView)
        view.addSubview(stackStatistics)
        view.addSubview(userNameLabel)
        view.addSubview(bioLabel)
        view.addSubview(titleCollectionLabel)
        view.addSubview(publicationsCollectionView)
        view.addSubview(blurView)
        view.addSubview(zoomPostView)
    }
    
    private func setupConstraints() {
        pictureView.frame = CGRect(x: 6,
                                   y: view.frame.width/4.2,
                                   width: view.frame.width/3,
                                   height: view.frame.width/3)
        Add.gradientBorder(with: pictureView, border: 50)
        
        stackStatistics.centerYAnchor.constraint(equalTo: pictureView.centerYAnchor).isActive = true
        stackStatistics.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor, constant: 14).isActive = true
        stackStatistics.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        stackStatistics.heightAnchor.constraint(equalToConstant: view.frame.width/4).isActive = true
        
        userNameLabel.topAnchor.constraint(equalTo: pictureView.bottomAnchor, constant: 10).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        bioLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 4).isActive = true
        bioLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor).isActive = true
        bioLabel.widthAnchor.constraint(equalToConstant: (view.frame.width/2) * 1.9).isActive = true
        
        titleCollectionLabel.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 80).isActive = true
        titleCollectionLabel.leadingAnchor.constraint(equalTo: bioLabel.leadingAnchor).isActive = true
        
        publicationsCollectionView.topAnchor.constraint(equalTo: titleCollectionLabel.bottomAnchor, constant: 20).isActive = true
        publicationsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        publicationsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        publicationsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.width/6) - 10).isActive = true
        
        blurView.frame = view.bounds
        
        zoomPostView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        zoomPostView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        zoomPostView.widthAnchor.constraint(equalToConstant: (view.frame.width/2) * 1.8).isActive = true
        zoomPostView.heightAnchor.constraint(equalToConstant: (view.frame.width/6) * 5).isActive = true
    }
}

extension PerfilViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let postController = PostViewController()
        postController.navigationItem.title = navigationItem.title
        postController.setupScreen(with: viewModel.posts[indexPath.row])
        
        let rootController = UINavigationController(rootViewController: postController)
        rootController.modalPresentationStyle = .fullScreen
        present(rootController, animated: true)
    }
}

extension PerfilViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallPostCollectionViewCell.identifier, for: indexPath)
                as? SmallPostCollectionViewCell else { return UICollectionViewCell() }
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(zoomInThePost))
        cell.addGestureRecognizer(longPress)
        cell.configureCell(with: viewModel.posts[indexPath.row].urls.regular)
        return cell
    }
}

extension PerfilViewController {
    @objc func zoomInThePost(_ gesture: UIGestureRecognizer) {
        
        switch(gesture.state) {
        case .began:
            guard let selectedCell = publicationsCollectionView.indexPathForItem(at: gesture.location(in: publicationsCollectionView))
            else { return }
            let post = viewModel.posts[selectedCell.row]
                        
            pictureUserImageView.sd_setImage(with: URL(string: post.user.profile_image.large), completed: nil)
            zoomUserNameLabel.text = post.user.username
            postImageView.sd_setImage(with: URL(string: post.urls.full), completed: nil)
            
            blurView.isHidden = false
            zoomPostView.isHidden = false
            
        case .ended:
            blurView.isHidden = true
            zoomPostView.isHidden = true
            
        case .possible, .changed, .cancelled, .failed: break
        @unknown default: break
        }
    }
}

extension PerfilViewController: PerfilViewDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.publicationsCollectionView.reloadData()
        }
    }
    func configurePage(with user: User) {
        DispatchQueue.main.async {
            self.navigationItem.title = Titles.userName(user.username)
            
            if let lastName = user.last_name {
                self.userNameLabel.text = user.first_name + " \(lastName)"
            }
            
            self.pictureImageView.sd_setImage(with: URL(string: user.profile_image.large), completed: nil)
            self.numberPublicationsLabel.text = "\(self.viewModel.posts.count)"
            self.numberFollowersLabel.text = "512"
            self.numberFollowingLabel.text = "2437"
        }
    }
}
