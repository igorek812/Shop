//
//  AssortmentCollectionViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 11.07.2021.
//

import UIKit

class AssortmentCollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var assortment: [AssortmentModel] = []
    
    func set(assortment: [AssortmentModel]) {
        self.assortment = assortment
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assortment.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AssortmentCell", for: indexPath) as? AssortmentCollectionViewCell {
            
//            cell.categoryLabel.text = assortment[indexPath.row].category.rawValue
//            cell.nameLabel.text = assortment[indexPath.row].name
//            cell.priceLabel.text = assortment[indexPath.row].price
//            cell.itemImage.image = assortment[indexPath.row].image
            
            cell.configureCell(assortmentCell: assortment[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}