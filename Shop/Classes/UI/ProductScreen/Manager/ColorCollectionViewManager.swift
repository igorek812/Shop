//
//  ColorCollectionViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 28.07.2021.
//

import UIKit

final class ColorCollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var color: [ColorModel] = []
    
    var didSelect: ((ColorModel) -> Void)?
    
    func set(product: ProductModel) {
        color = product.color
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return color.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as? ColorCollectionViewCell {
            
            cell.configureCell(cellModel: color[indexPath.row])
            
            return cell
        }
        
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 30
        let height: CGFloat = 30
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as? ColorCollectionViewCell {
            cell.layer.shadowColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            cell.layer.shadowRadius = 10
            //didSelect?(color[indexPath.row])
        }
    }
}
