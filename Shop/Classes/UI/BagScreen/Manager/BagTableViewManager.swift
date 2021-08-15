//
//  BagTableViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 27.07.2021.
//

import UIKit

final class BagTableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var productInBag: [BagModel] = []
    
    var didSelect: ((Int) -> Void)?
    
    func set(productInBag: [BagModel]) {
        self.productInBag = productInBag
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productInBag.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BagCell", for: indexPath) as? BagTableViewCell {
            
            cell.configureCell(cellModel: productInBag[indexPath.row])
            didSelect?(indexPath.row)
            return cell
        }
        
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            BacketData.shared.removeProductInBag(product: productInBag[indexPath.row])
            productInBag.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}
