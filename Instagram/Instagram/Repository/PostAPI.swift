//
//  PostAPI.swift
//  Instagram
//
//  Created by Usr_Prime on 30/05/22.
//

import Foundation

class APIDetails {
    let urlDefault = "https://api.unsplash.com/"
    let complementKey = "a4VKsuNSGbJuXAPRVK4XU3QFJcxrCKGekd8inAxEn40"
    let parameter = "?client_id="
}

class PostAPI {
    let api = APIDetails()
    static let shared = PostAPI()
    
    func getPost(completion: @escaping (Result<[PostAPIResponse], Error>) -> Void) {
        guard let url = URL(string: "\(api.urlDefault)photos/\(api.parameter)\(api.complementKey)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let result = try JSONDecoder().decode([PostAPIResponse].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
