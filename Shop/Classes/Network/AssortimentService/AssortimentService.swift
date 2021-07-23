//
//  AssortimentService.swift
//  Shop
//
//  Created by Igor on 22.07.2021.
//

import Foundation

final class AssortimentService {
    
    let items: [AssortmentModel] = [
        AssortmentModel.init(image: #imageLiteral(resourceName: "menu4"), name: "Жопа", price: "3500", category: .new),
        AssortmentModel.init(image: #imageLiteral(resourceName: "menu4"), name: "Жопа2", price: "3500", category: .new),
        AssortmentModel.init(image: #imageLiteral(resourceName: "menu4"), name: "Жопа3", price: "3500", category: .pants),
        AssortmentModel.init(image: #imageLiteral(resourceName: "menu4"), name: "Жопа4", price: "3500", category: .sales),
        AssortmentModel.init(image: #imageLiteral(resourceName: "menu4"), name: "Жопа5", price: "3500", category: .tops)
    ]
    
    func getItemsBy(category: AssortmentCategory) -> [AssortmentModel] {
        return items.filter { $0.category == category }
    }
}
