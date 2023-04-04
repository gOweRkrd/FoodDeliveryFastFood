//
//  Resources.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import UIKit

enum Resources {
    enum String {
        enum Network {
            static let url = "https://apex.oracle.com/pls/apex/dashashevchenkoapps/testapi/"
            static let path = "products"
        }
        
        enum TabBar {
            static let menu = "Меню"
            static let contacts = "Контакты"
            static let profile = "Профиль"
            static let basket = "Корзина"
        }
        
        enum Cities {
            static let moscow = "Москва"
        }
        
        enum Price {
            static let price = "от 345 р"
        }
        
        enum Categories {
            static let categories = [
                "Пицца",
                "Комбо",
                "Десерты",
                "Напитки",
                "Другие товары"
            ]
        }
    }
    
    enum Color {
        static let icon = UIColor(hexString: "#C3C4C9")
        static let activeIcon = UIColor(hexString: "#FD3A69")
        static let cityText = UIColor(hexString: "#222831")
        static let background = UIColor(hexString: "#F3F5F9")
        static let description = UIColor(hexString: "#AAAAAD")
    }
    
    enum Icons {
        enum TabBar {
            static let menu = UIImage(named: "menu")!
            static let contacts = UIImage(named: "contacts")!
            static let profile = UIImage(named: "profile")!
            static let basket = UIImage(named: "basket")!
        }
    }
    
    enum Image {
        static let arrow = UIImage(named: "arrow")!
        static let banners = [
            UIImage(named: "banner1")!,
            UIImage(named: "banner2")!,
            UIImage(named: "banner3")!,
            UIImage(named: "banner4")!
        ]
    }
}
typealias R = Resources
