//
//  NetworkService.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import Foundation

class NetworkService {
    func request(path: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let urlForRequest = URL(string: R.String.Network.url + path) else { return }
        
        let task = URLSession.shared.dataTask(with: urlForRequest) { data, _, error in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
