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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            BacketData.shared.removeProductInFavourite(product: favouriteProduits[indexPath.row])
            favouriteProduits.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    
}
