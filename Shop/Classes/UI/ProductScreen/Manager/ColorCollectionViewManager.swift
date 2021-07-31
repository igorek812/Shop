//
//  ColorCollectionViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 28.07.2021.
//

import UIKit

class ColorCollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var color: [ColorModel] = []
    
    func set(product: ProductModel) {
        color = product.color
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return color.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as? ColorCollectionViewCell {
            
            cell.backgroundColor = color[indexPath.row].color
            
            cell.layer.cornerRadius = cell.frame.height / 2
            return cell
        }
        
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 30
        let height: CGFloat = 30
        
        return CGSize(width: width, height: height)
    }
    
}
