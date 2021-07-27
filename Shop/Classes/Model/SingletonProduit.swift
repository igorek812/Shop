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
    
    var favouriteProducts: [AssortmentModel] = []
    var productInBag: [AssortmentModel] = []
    
    func addProductInFavourite(product: AssortmentModel) {
        self.favouriteProducts.append(product)
    }
    
    func removeProductInFavourite(product: AssortmentModel) {
        for (i, value) in self.favouriteProducts.enumerated() {
            if value.name == product.name {
                self.favouriteProducts.remove(at: i)
            }
        }
    }
    
    func addProductToBag(product: AssortmentModel) {
        self.productInBag.append(product)
    }
    
    func removeProductInBag(product: AssortmentModel) {
        for (i, value) in self.productInBag.enumerated() {
            if value.name == product.name {
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
