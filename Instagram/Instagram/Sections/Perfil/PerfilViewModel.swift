//
//  PerfilViewModel.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import Foundation

protocol PerfilViewDelegate: AnyObject {
    func reloadData()
    func configurePage(with user: User)
}

class PerfilViewModel {
    var delegate: PerfilViewDelegate?
    var posts: [PostAPIResponse] = []
    
    func getPublications() {
        PerfilAPI.shared.getPublications { result in
            switch result {
            case .success(let post):
                self.posts = post
                self.delegate?.reloadData()
                self.delegate?.configurePage(with: post[0].user)
            case .failure(let error):
                print("Fez merda menó --> \(error)")
            }
        }
    }
}
