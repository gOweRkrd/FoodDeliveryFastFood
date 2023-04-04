//
//  MenuModuleRouter.swift
//  FoodDeliveryFastFood
//
//  Created by Александр Косяков on 03.04.2023.
//

import UIKit

final class MenuModuleRouter {
    
    private var view: MenuModuleViewController
    private var presenter: MenuModulePresenter?
        
    init() {
        view = MenuModuleViewController()
        presenter = MenuModulePresenter(viewInput: view)
        view.setViewOutput(viewOutput: presenter!)
    }
        
    func getView() -> UIViewController {
        return view
    }
}
