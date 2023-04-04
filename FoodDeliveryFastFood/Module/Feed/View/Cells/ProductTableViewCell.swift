//
//  ProductTableViewCell.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import UIKit

private enum Constants {
    static let nameLabelFont: CGFloat = 17
    static let nameLabelDescriptionLabel: CGFloat = 13
    static let priceButtonTop: CGFloat = 16
    static let priceButtonWidth: CGFloat = 87
    static let priceButtonCornerRadius: CGFloat = 6.0
    static let priceButtonBorderWidth: CGFloat = 1.0
    static let titleLabelFont: CGFloat = 13
    static let topBottomConstrains: CGFloat = 10
    static let BottomTrailingConstrains: CGFloat = 24
    static let productImageWidthHeight: CGFloat = 132
    static let productImageLeading: CGFloat = 16
    static let nameLabelLeading: CGFloat = 32
    static let descriptionLabelTop: CGFloat = 8    
}

final class ProductTableViewCell: UITableViewCell {
    
    static let id = String(describing: ProductTableViewCell.self)
    
    var image: UIImage? = UIImage() {
        didSet {
            productImage.image = image
        }
    }
    
    var name = "" {
        didSet {
            nameLabel.text = name
        }
    }
    
    var descriptionText: String? = "" {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    private var productImage = UIImageView()
    private var nameLabel = UILabel()
    private var descriptionLabel = UILabel()
    private var priceButton = UIButton()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setup()
        layout()
    }
    
    // MARK: - Public
    
    func setButtonTitle(coast: Int, _ id: Int) {
        if id == 1 {
            priceButton.setTitle("от \(coast) р", for: .normal)
        } else {
            priceButton.setTitle("\(coast) р", for: .normal)
        }
    }
    
    // MARK: - Private
    
    private func setup() {
        productImage.contentMode = .scaleAspectFit
        productImage.clipsToBounds = true
        
        nameLabel.font = .systemFont(ofSize: Constants.nameLabelFont, weight: .semibold)
        nameLabel.numberOfLines = 2
        nameLabel.textColor = .black
        
        descriptionLabel.font = .systemFont(ofSize: Constants.nameLabelDescriptionLabel, weight: .regular)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = R.Color.description
        
        priceButton.layer.cornerRadius = Constants.priceButtonCornerRadius
        priceButton.layer.borderWidth = Constants.priceButtonBorderWidth
        priceButton.layer.borderColor = R.Color.activeIcon.cgColor
        priceButton.setTitle( R.String.Price.price, for: .normal)
        priceButton.setTitleColor(R.Color.activeIcon, for: .normal)
        priceButton.titleLabel?.font = .systemFont(ofSize: Constants.titleLabelFont, weight: .regular)
    }
    
    private func layout() {
        addSubview(productImage)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(priceButton)
        
        productImage.prepareForAutoLayout()
        nameLabel.prepareForAutoLayout()
        descriptionLabel.prepareForAutoLayout()
        priceButton.prepareForAutoLayout()
        
        let constraints = [
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topBottomConstrains),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.productImageLeading),
            productImage.widthAnchor.constraint(equalToConstant: Constants.productImageWidthHeight),
            productImage.heightAnchor.constraint(equalToConstant: Constants.productImageWidthHeight),
            productImage.bottomAnchor.constraint(
                lessThanOrEqualTo: bottomAnchor,
                constant: -Constants.topBottomConstrains
            ),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topBottomConstrains),
            nameLabel.leadingAnchor.constraint(
                equalTo: productImage.trailingAnchor,
                constant: Constants.nameLabelLeading
            ),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.BottomTrailingConstrains),
            
            descriptionLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: Constants.descriptionLabelTop
            ),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            priceButton.topAnchor.constraint(
                greaterThanOrEqualTo: descriptionLabel.bottomAnchor,
                constant: Constants.priceButtonTop
            ),
            priceButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -Constants.BottomTrailingConstrains
            ),
            priceButton.widthAnchor.constraint(equalToConstant: Constants.priceButtonWidth),
            priceButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.BottomTrailingConstrains)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
