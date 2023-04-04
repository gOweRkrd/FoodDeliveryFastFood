//
//  ImageLoader.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import UIKit

enum ImageLoader {
    static func loadImage(from url: URL, _ completion: @escaping (Result<UIImage, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data, let image = UIImage(data: data) {
                completion(.success(image))
            }
        }
        .resume()
    }
}
