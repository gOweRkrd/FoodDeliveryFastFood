//
//  MenuModulePresenter.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import Foundation

protocol MenuModuleViewInput: AnyObject {
    func reloadData()
}

protocol MenuModuleInteractorInput: AnyObject {
    func getRequestForAllProducts()
    func getAllProducts() -> Info?
    func getCountOfProducts() -> Int
    func getCountCellsHigher(_ section: Int) -> Int
    func defineCategory(_ id: Int) -> Int
}

final class MenuModulePresenter {
    
    private weak var viewInput: MenuModuleViewInput?
    private var interactorInput: MenuModuleInteractorInput?
        
    init(viewInput: MenuModuleViewInput) {
        self.viewInput = viewInput
        self.interactorInput = MenuModuleInteractor(interactorOutput: self)
    }
}

// MARK: - View Output

extension MenuModulePresenter: MenuModuleViewOutput {
    func getRequestForAllProducts() {
        interactorInput?.getRequestForAllProducts()
    }
    
    func getAllProducts() -> Info? {
        interactorInput?.getAllProducts()
    }
    
    func getCountOfProducts() -> Int {
        guard let interactorInput = interactorInput else {
            return 0
        }
        return interactorInput.getCountOfProducts()
    }
    
    func getCountCellsHigher(_ section: Int) -> Int {
        guard let interactorInput = interactorInput else {
            return 0
        }
        return interactorInput.getCountCellsHigher(section)
    }
    
    func defineCategory(_ id: Int) -> Int {
        interactorInput?.defineCategory(id) ?? 1
    }
}

// MARK: - Interactor Output

extension MenuModulePresenter: MenuModuleInteractorOutput {
    func reloadData() {
        viewInput?.reloadData()
    }   
}
