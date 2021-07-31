//
//  FavouriteTableViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 25.07.2021.
//

import UIKit

class FavouriteTableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var favouriteProduits: [ProductModel] = []
    
    var didSelect: ((ProductModel) -> Void)?
    
    func set(favouriteProduits: [ProductModel]) {
        self.favouriteProduits = favouriteProduits
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteProduits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell", for: indexPath) as? FavouriteTableViewCell {
            
            cell.configureCell(cellModel: favouriteProduits[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect?(favouriteProduits[indexPath.row])
    }
    
    
}
