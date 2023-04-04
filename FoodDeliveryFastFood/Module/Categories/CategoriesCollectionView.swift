//
//  CategoriesCollectionView.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import UIKit

protocol CategoriesOutput: AnyObject {
    func scrollToRow(name: String)
}

private enum Constants {
    static let cGRectSize: CGFloat = 0
    static let frameWidth: CGFloat = 23
    static let frameHeight: CGFloat = 4
    static let frameHeightReturn: CGFloat = 32
    static let lineSpacing: CGFloat = 8
    static let layoutLeadingTrailing: CGFloat = 16
    static let layoutBottom: CGFloat = 24
}

final class CategoriesCollectionView: UICollectionView {
    
    private var items = [String]()
    private var scrollView = UIScrollView()
    private weak var categoriesOutput: CategoriesOutput?
    
    init(items: [String], frame: CGRect) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: flowLayout)
        
        self.items = items
        self.frame = frame
        
        self.setupCollection()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Public
    
    func setOutput(categoriesOutput: CategoriesOutput) {
        self.categoriesOutput = categoriesOutput
    }
    
    func copyCategories(isTapped: Bool) -> CategoriesCollectionView {
        let copy = Self(items: items, frame: frame)
        let activeCell = self.indexPathsForSelectedItems![0]
        copy.scrollToItem(at: activeCell, at: .centeredHorizontally, animated: false)
        copy.backgroundColor = R.Color.background
        copy.selectItem(at: activeCell, animated: false, scrollPosition: .centeredHorizontally)
        if !isTapped {
            copy.contentOffset = scrollView.contentOffset
        }
        return copy
    }
    
    func changeValue(_ copy: CategoriesCollectionView, isTapped: Bool) {
        let activeCell = copy.indexPathsForSelectedItems![0]
        scrollToItem(at: activeCell, at: .centeredHorizontally, animated: false)
        selectItem(at: activeCell, animated: false, scrollPosition: .centeredHorizontally)
        if !isTapped {
            contentOffset = copy.scrollView.contentOffset
        }
    }
    
    // MARK: - Private
    
    private func setupCollection() {
        self.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: CategoryCollectionCell.id)
        showsHorizontalScrollIndicator = false
        dataSource = self
        delegate = self
    }
}

// MARK: - DataSource, Delegate

extension CategoriesCollectionView: UICollectionViewDataSource,
                                    UICollectionViewDelegate,
                                    UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: CategoryCollectionCell.id,
            for: indexPath
        ) as? CategoryCollectionCell else { return UICollectionViewCell() }
        if collectionView.indexPathsForSelectedItems?.contains(indexPath) ?? false {
            cell.isSelected = true
        } else {
            cell.isSelected = false
        }
        cell.name = items[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = items[indexPath.row]
        label.sizeToFit()
        label.frame = CGRect(
            x: Constants.cGRectSize,
            y: Constants.cGRectSize,
            width: label.frame.width + Constants.frameWidth,
            height: label.frame.height + Constants.frameHeight
        )
        return CGSize(width: label.frame.width, height: Constants.frameHeightReturn)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionCell else {
            return
        }
        categoriesOutput?.scrollToRow(name: cell.name)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(
            top: Constants.cGRectSize,
            left: Constants.layoutLeadingTrailing,
            bottom: Constants.layoutBottom,
            right: Constants.layoutLeadingTrailing
        )
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.scrollView = scrollView
    }
}
