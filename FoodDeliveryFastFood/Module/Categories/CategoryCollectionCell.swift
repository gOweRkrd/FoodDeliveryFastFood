//
//  CategoryCollectionCell.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import UIKit

private enum Constants {
    static let cGRectSize: CGFloat = 0
    static let frameWidth: CGFloat = 23
    static let frameHeight: CGFloat = 4
    static let frameHeightReturn: CGFloat = 32
    static let lineSpacing: CGFloat = 8
    static let layoutLeadingTrailing: CGFloat = 16
    static let layoutBottom: CGFloat = 24
}

final class CategoryCollectionCell: UICollectionViewCell {
    
    static let id = String(describing: CategoryCollectionCell.self)
    
    var name = "" {
        didSet {
            categoryLabel.text = name
        }
    }
    
    private var color = R.Color.activeIcon {
        didSet {
            categoryLabel.textColor = color
        }
    }
    
    private let categoryLabel = UILabel()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                color = R.Color.activeIcon
                categoryLabel.font = .systemFont(ofSize: 13, weight: .bold)
                backgroundColor = R.Color.activeIcon.withAlphaComponent(0.2)
                layer.cornerRadius = 15
                layer.borderWidth = 0.0
            } else {
                color = R.Color.activeIcon.withAlphaComponent(0.4)
                categoryLabel.font = .systemFont(ofSize: 13, weight: .medium)
                backgroundColor = R.Color.background
                layer.borderWidth = 1
                layer.cornerRadius = 15
                layer.borderColor = R.Color.activeIcon.withAlphaComponent(0.4).cgColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = R.Color.background
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        categoryLabel.font = .systemFont(ofSize: 13, weight: .medium)
        categoryLabel.textAlignment = .center
    }
    
    private func layout() {
        addSubview(categoryLabel)
        categoryLabel.prepareForAutoLayout()
        
        let constraints = [
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryLabel.widthAnchor.constraint(equalTo: widthAnchor),
            categoryLabel.heightAnchor.constraint(equalTo: heightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
