//
//  SingletonProduit.swift
//  Shop
//
//  Created by Евгений Прохоров on 18.07.2021.
//

import UIKit

class BacketData {
    
    static let shared = BacketData()
    private init() {}
    
    var favouriteProducts: [ProductModel] = []
    var productInBag: [BagModel] = []
    
    func addProductInFavourite(product: ProductModel) {
        if !self.favouriteProducts.contains(where: { product in
            return true
        }) {
            self.favouriteProducts.append(product)
        }
    }
    
    func removeProductInFavourite(product: ProductModel) {
        for (i, value) in self.favouriteProducts.enumerated() {
            if value.name == product.name {
                self.favouriteProducts.remove(at: i)
            }
        }
    }
    
    func addProductToBag(product: ProductModel, size: String, color: String) {
        if !self.productInBag.contains(where: { product in
            return true
        }) {
            let product = BagModel.init(product: product, selectedSize: size, selectedColor: color, count: "1")
            self.productInBag.append(product)
        }
    }
    
    func removeProductInBag(product: BagModel) {
        for (i, value) in self.productInBag.enumerated() {
            if value.product.name == product.product.name {
                self.productInBag.remove(at: i)
            }
        }
    }
}

extension BacketData: NSCopying {

    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
    
}
