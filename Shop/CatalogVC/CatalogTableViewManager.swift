//
//  CatalogTableViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 10.07.2021.
//

import UIKit

class CatalogTableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var cellModels: [CatalogModel] = []
    
    var didSelect: ((Int) -> Void)?
    
    func set(cellModels: [AssortmentSectionModel]) {
        for item in cellModels {
            self.cellModels = self.cellModels + item.items
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CatalogTableViewCell {
            
            cell.nameLabel.text = cellModels[indexPath.row].title
            cell.backgroundImageView.image = cellModels[indexPath.row].image
            return cell
        }
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect?(indexPath.row)
    }
    
}
