//
//  BannerCollectionViewCell.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import UIKit

private enum Constants {
    static let cornerRadius: CGFloat = 10
}

final class BannerCollectionViewCell: UICollectionViewCell {

    static let id = String(describing: BannerCollectionViewCell.self)
        
    var image = UIImage() {
        didSet {
            imageView.image = image
        }
    }
    
    private var imageView = UIImageView()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private
    
    private func setup() {
        backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Constants.cornerRadius
    }
    
    private func layout() {
        addSubview(imageView)
        imageView.prepareForAutoLayout()
        
        let constraints = [
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
