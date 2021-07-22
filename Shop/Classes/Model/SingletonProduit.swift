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
    
    var produit: [ProduitModel] = []
    
    func addProduitInBag(id: Int) {}
    
    func removeProduitInBag(id: Int) {}
}

extension BacketData: NSCopying {

    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
    
}
