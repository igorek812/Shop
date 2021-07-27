//
//  BagTableViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 27.07.2021.
//

import UIKit

class BagTableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var productInBag: [ProductModel] = []
    
    func set(productInBag: [ProductModel]) {
        self.productInBag = productInBag
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productInBag.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BagCell", for: indexPath) as? BagTableViewCell {
            
            cell.nameLabel.text = productInBag[indexPath.row].name
            cell.priceLabel.text = productInBag[indexPath.row].price
            cell.productImage.image = productInBag[indexPath.row].image[0].image
            
            return cell
        }
        
        return UITableViewCell.init()
    }
}

extension BagTableViewManager {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            productInBag.remove(at: indexPath.row)
            BacketData.shared.removeProductInBag(product: productInBag[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}
