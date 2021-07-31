//
//  CatalogTableViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 10.07.2021.
//

import UIKit

class CatalogTableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var cellModels: [CatalogViewModel] = []
    
    var didSelect: ((AssortmentCategory) -> Void)?
    
    func set(cellModels: [CatalogViewModel]) {
        self.cellModels = cellModels
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CatalogTableViewCell {
            
            cell.configureCell(cellModel: cellModels[indexPath.row])
            
            return cell
        }
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect?(cellModels[indexPath.row].category)
    }
    
}
