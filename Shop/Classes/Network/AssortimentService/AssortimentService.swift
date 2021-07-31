//
//  AssortimentService.swift
//  Shop
//
//  Created by Igor on 22.07.2021.
//

import UIKit

final class AssortimentService {
    
    let items: [ProductModel] = [
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "shorts"))], name: "Моделирующие шорты с боковым карманом (W4/1)", price: "3500 ₽", article: "Артикул: W4/1-08324-40-(XS)", color: [ColorModel.init(color: UIColor.blue)], size: [SizeModel.init(size: "42(S)")], category: .new),
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "shorts"))], name: "Жопа2", price: "3500", article: "Артикул: W4/1-08324-40-(XS)", color: [ColorModel.init(color: UIColor(red: 255, green: 234, blue: 133, alpha: 1))], size: [SizeModel.init(size: "42(S)")], category: .new),
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "shorts"))], name: "Жопа3", price: "3500", article: "Артикул: W4/1-08324-40-(XS)", color: [ColorModel.init(color: UIColor(red: 255, green: 234, blue: 133, alpha: 1))], size: [SizeModel.init(size: "42(S)")], category: .pants),
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "shorts"))], name: "Жопа4", price: "3500", article: "Артикул: W4/1-08324-40-(XS)", color: [ColorModel.init(color: UIColor(red: 255, green: 234, blue: 133, alpha: 1))], size: [SizeModel.init(size: "42(S)")], category: .sales),
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "shorts"))], name: "Жопа5", price: "3500", article: "Артикул: W4/1-08324-40-(XS)", color: [ColorModel.init(color: UIColor(red: 255, green: 234, blue: 133, alpha: 1))], size: [SizeModel.init(size: "42(S)")], category: .tops)
    ]
    
    func getItemsBy(category: AssortmentCategory) -> [ProductModel] {
        return items.filter { $0.category == category }
    }
}
