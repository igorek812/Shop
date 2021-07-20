//
//  SingletonProduit.swift
//  Shop
//
//  Created by Евгений Прохоров on 18.07.2021.
//

import UIKit

class SingletonProduit {
    
    static let shared = SingletonProduit()
    
    var produit: [ProduitModel] = []
    
    func addProduitInBag(id: Int) {}
    
    func removeProduitInBag(id: Int) {}
    
    private init() {}
}

extension SingletonProduit: NSCopying {

    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
    
}
