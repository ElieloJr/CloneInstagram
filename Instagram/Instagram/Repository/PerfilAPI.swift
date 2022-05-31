//
//  PerfilAPI.swift
//  Instagram
//
//  Created by Usr_Prime on 31/05/22.
//

import Foundation

class PerfilAPI {
    static let shared = PerfilAPI()
    
    func getPublications(completion: @escaping (Result<[PostAPIResponse], Error>) -> Void) {
        guard let url = URL(string: "https://api.unsplash.com/users/yespanioly/photos/?client_id=a4VKsuNSGbJuXAPRVK4XU3QFJcxrCKGekd8inAxEn40") else { return }
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
