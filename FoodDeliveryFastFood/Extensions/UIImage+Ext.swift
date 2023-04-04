//
//  UIImage+Ext.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import UIKit

extension UIImage {
    static func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        ImageLoader.loadImage(from: url) { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    completion(image)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
