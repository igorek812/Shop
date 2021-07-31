//
//  SizeCollectionViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 28.07.2021.
//

import UIKit

class SizeCollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var sizeProduct: [SizeModel] = []
    
    func set(product: ProductModel) {
        sizeProduct = product.size
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sizeProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SizeCell", for: indexPath) as? SizeCollectionViewCell {
            
            cell.sizeLabel.text = sizeProduct[indexPath.row].size
            cell.backgroundColor = UIColor.lightGray
            cell.sizeLabel.textColor = UIColor.white
            
            return cell
        }
        
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 4
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
    
}
