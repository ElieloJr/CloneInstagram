//
//  ActivityViewModel.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import Foundation

protocol ActivityViewDelegate: AnyObject {
    func reloadData()
}

class ActivityViewModel {
    var delegate: ActivityViewDelegate?
    var user: [PostAPIResponse] = []
    
    func getUsers() {
        PostAPI.shared.getPost { result in
            switch result {
            case .success(let post):
                self.user = post
                self.delegate?.reloadData()
            case .failure(let error):
                print("Fez merda menó --> \(error)")
            }
        }
    }
}
