//
//  UIView+Ext.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import UIKit

extension UIView {
    @discardableResult
    func prepareForAutoLayout() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
