//
//  AssortimentService.swift
//  Shop
//
//  Created by Igor on 22.07.2021.
//

import Foundation

final class AssortimentService {
    
    let items: [ProductModel] = [
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "shorts"))], name: "Жопа", price: "3500", article: "Артикул: W4/1-08324-40-(XS)", category: .new),
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "shorts"))], name: "Жопа2", price: "3500", article: "Артикул: W4/1-08324-40-(XS)", category: .new),
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "shorts"))], name: "Жопа3", price: "3500", article: "Артикул: W4/1-08324-40-(XS)", category: .pants),
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "shorts"))], name: "Жопа4", price: "3500", article: "Артикул: W4/1-08324-40-(XS)", category: .sales),
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "shorts"))], name: "Жопа5", price: "3500", article: "Артикул: W4/1-08324-40-(XS)", category: .tops)
    ]
    
    func getItemsBy(category: AssortmentCategory) -> [ProductModel] {
        return items.filter { $0.category == category }
    }
}
