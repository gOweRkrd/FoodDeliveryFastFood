//
//  BannersTableViewCell.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import UIKit

private enum Constants {
    static let separatorInsetSize: CGFloat = 0
    static let separatorInsetLeft: CGFloat = 1000
    static let bannersWidth: CGFloat = 300
    static let bannersHeight: CGFloat = 112
    static let collectionViewSize: CGFloat = 16
    static let borderWidth: CGFloat = 1.0
    static let shadowOffsetWidth: CGFloat = 0
    static let shadowOffsetHeight: CGFloat = 2.0
    static let shadowRadius: CGFloat = 5.0
    static let shadowOpacity: CGFloat = 0.17
}

final class BannersTableViewCell: UITableViewCell {
    
    static let id = String(describing: BannersTableViewCell.self)
    
    private var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        return UICollectionView(frame: .infinite, collectionViewLayout: flowLayout)
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupCollectionView()
        layout()
    }
    
    // MARK: - Private
    
    private func setupCollectionView() {
        collectionView.backgroundColor = R.Color.background
        backgroundColor = R.Color.background
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(
            BannerCollectionViewCell.self,
            forCellWithReuseIdentifier: BannerCollectionViewCell.id
        )
    }
    
    private func layout() {
        addSubview(collectionView)
        collectionView.prepareForAutoLayout()
        
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setup(_ cell: UICollectionViewCell) {
        cell.contentView.layer.borderWidth = Constants.borderWidth
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: Constants.shadowOffsetWidth, height: Constants.shadowOffsetHeight)
        cell.layer.shadowRadius = Constants.shadowRadius
        cell.layer.shadowOpacity = Float(Constants.shadowOpacity)
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(
            roundedRect: cell.bounds,
            cornerRadius: cell.contentView.layer.cornerRadius
        ).cgPath
        separatorInset = UIEdgeInsets(
            top: Constants.separatorInsetSize,
            left: Constants.separatorInsetLeft,
            bottom: Constants.separatorInsetSize,
            right: Constants.separatorInsetSize
        )
    }
}

// MARK: - Collection ViewDataSource

extension BannersTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        R.Image.banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath
        )
                as? BannerCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.image = R.Image.banners[indexPath.row]
        setup(cell)
        return cell
    }
}

// MARK: - CollectionView DelegateFlowLayout

extension BannersTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.bannersWidth, height: Constants.bannersHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.collectionViewSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(
            top: Constants.collectionViewSize,
            left: Constants.collectionViewSize,
            bottom: Constants.collectionViewSize,
            right: Constants.collectionViewSize
        )
    }
}
