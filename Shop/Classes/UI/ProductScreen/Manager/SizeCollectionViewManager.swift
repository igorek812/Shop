//
//  SizeCollectionViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 28.07.2021.
//

import UIKit

final class SizeCollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var sizeProduct: [SizeModel] = []
    
    var didSelect: ((String) -> Void)?
    
    func set(product: ProductModel) {
        sizeProduct = product.size
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sizeProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SizeCell", for: indexPath) as? SizeCollectionViewCell {
            
            cell.configureCell(cellModel: sizeProduct[indexPath.row])
            
            return cell
        }
        
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 4
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? SizeCollectionViewCell {
            cell.backgroundColor = .lightGray
            cell.sizeLabel.textColor = .white
            didSelect?(cell.sizeLabel.text ?? "")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? SizeCollectionViewCell {
            cell.backgroundColor = .white
            cell.sizeLabel.textColor = .systemGray
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
}
