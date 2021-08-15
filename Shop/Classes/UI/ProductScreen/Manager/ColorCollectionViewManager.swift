//
//  ColorCollectionViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 28.07.2021.
//

import UIKit

final class ColorCollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var color: [ColorModel] = []
    var image: [ProductImageModel] = []
    
    var didSelect: ((ColorModel) -> Void)?
    
    func set(product: ProductModel) {
        color = product.color
        image = product.image
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return color.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as? ColorCollectionViewCell {
            
            if (indexPath.row == 0) {
                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
                cell.configureSelectedCell(cellModel: color[indexPath.row])
                return cell
            }
            else {
                cell.configureCell(cellModel: color[indexPath.row])
                return cell
            }
        }
        
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 30
        let height: CGFloat = 30
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? ColorCollectionViewCell {
            
            cell.layer.borderWidth = 4
            cell.layer.borderColor = UIColor.systemGray.cgColor
            didSelect?(color[indexPath.row])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? ColorCollectionViewCell {
    
                cell.layer.borderWidth = 1
                cell.layer.borderColor = UIColor.systemGray.cgColor
            
        }
    }
}
