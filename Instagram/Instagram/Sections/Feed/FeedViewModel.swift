//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import Foundation

protocol FeedViewDelegate: AnyObject {
    func reloadData()
}

protocol StatusHeaderDelegate {
    func reloadData()
    func setStatus(with posts: [PostAPIResponse])
}

class FeedViewModel {
    var statusDelegate: StatusHeaderDelegate?
    var delegate: FeedViewDelegate?
    var posts: [PostAPIResponse] = []
    
    func getPosts() {
        PostAPI.shared.getPost { result in
            switch result {
            case .success(let post):
                self.posts = post
                self.delegate?.reloadData()
            case .failure(let error):
                print("Fez merda menó --> \(error)")
            }
        }
    }
    func getStatus() {
        PostAPI.shared.getPost { result in
            switch result {
            case .success(let status):
                self.statusDelegate?.setStatus(with: status)
                self.statusDelegate?.reloadData()
            case .failure(let error):
                print("Fez merda menó --> \(error)")
            }
        }
    }
}
