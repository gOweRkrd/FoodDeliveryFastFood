//
//  MenuModuleEntity.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import UIKit

struct Info: Codable {
    var items: [Item]
}

struct NameCategory: Codable {
    let nameCategory: String
}

struct Item: Codable {
    enum CodingKeys: String, CodingKey {
        case id, name, idCategory
        case itemDescription = "description"
        case minSum, urlImage, nameCategory
    }
    
    let id: Int
    let name: String
    let idCategory: Int
    let itemDescription: String?
    let minSum: Int
    let urlImage: String
    let nameCategory: [NameCategory]
    var image: UIImage?
}
