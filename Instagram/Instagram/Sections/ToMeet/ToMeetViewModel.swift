//
//  ToMeetViewModel.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import Foundation

protocol ToMeetViewDelegate: AnyObject {
    func reloadData()
}

class ToMeetViewModel {
    var delegate: ToMeetViewDelegate?
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
        PostAPI.shared.getPost { result in
            switch result {
            case .success(let post):
                self.posts.append(contentsOf: post)
                self.delegate?.reloadData()
            case .failure(let error):
                print("Fez merda menó --> \(error)")
            }
        }
        PostAPI.shared.getPost { result in
            switch result {
            case .success(let post):
                self.posts.append(contentsOf: post)
                self.delegate?.reloadData()
            case .failure(let error):
                print("Fez merda menó --> \(error)")
            }
        }
    }
}
