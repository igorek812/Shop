//
//  AssortmentCollectionViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 11.07.2021.
//

import UIKit

final class AssortmentCollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var assortment: [ProductModel] = []
    
    func set(assortment: [ProductModel]) {
        self.assortment = assortment
    }
    
    var didSelect: ((ProductModel) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assortment.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AssortmentCell", for: indexPath) as? AssortmentCollectionViewCell {
            
            cell.configureCell(assortmentCell: assortment[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelect?(assortment[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat = collectionView.frame.height / 2
        let width = collectionView.frame.width / 2 - 10
        
        return CGSize(width: width, height: height)
    }
    
}
