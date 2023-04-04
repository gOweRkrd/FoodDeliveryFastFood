//
//  CategoriesTableViewCell.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import UIKit

private enum Constants {
    static let CGRectSize: CGFloat = 0
    static let CGRectY: CGFloat = 10
    static let CGRectHeight: CGFloat = 56
}

final class CategoriesTableViewCell: UITableViewCell {
    
    static let id = String(describing: CategoriesTableViewCell.self)
    
    var collectionView = CategoriesCollectionView(
        items: R.String.Categories.categories,
        frame: CGRect(
            x: Constants.CGRectSize,
            y: Constants.CGRectY,
            width: UIScreen.main.bounds.width,
            height: Constants.CGRectHeight
        )
    )
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setup()
    }
    
    private func setup() {
        collectionView.dataSource = collectionView
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .bottom)
        collectionView.collectionView(collectionView, didSelectItemAt: IndexPath(item: 0, section: 0))
        addSubview(collectionView)
        
        backgroundColor = R.Color.background
        collectionView.backgroundColor = R.Color.background        
    }
}
