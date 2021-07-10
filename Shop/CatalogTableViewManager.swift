//
//  CatalogTableViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 10.07.2021.
//

import UIKit

class CatalogTableViewManager: NSObject, UITableViewDataSource {
    
    private var cellModels: [CatalogModel] = []
    
    func set(cellModels: [CatalogModel]) {
        self.cellModels = cellModels
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CatalogTableViewCell {
            
            
            return cell
        }
        return UITableViewCell.init()
    }
}
