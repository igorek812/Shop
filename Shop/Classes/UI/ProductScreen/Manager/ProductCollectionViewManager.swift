//
//  ProductCollectionViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 27.07.2021.
//

import UIKit

final class ProductCollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var selectedCell: ProductCollectionViewCell?
    var selectedCellImageViewSnapshot: UIView?
    
    var imageProduct: [ProductImageModel] = []
    var colorName: String = ""
    
    var didSelect: ((ProductImageModel) -> Void)?
    var updatePage: ((Int) -> Void)?
    
    func set(imageProduct: [ProductImageModel], colorName: String) {
        for i in imageProduct {
            if i.color == colorName {
                self.imageProduct.append(i)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCollectionViewCell {
            
                cell.configureCell(cellModel: imageProduct[indexPath.row])
            
                return cell
        }
        
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width 
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedCell = collectionView.cellForItem(at: indexPath) as? ProductCollectionViewCell
        selectedCellImageViewSnapshot = selectedCell?.productImageView.snapshotView(afterScreenUpdates: false)
        
        didSelect?(imageProduct[indexPath.row])
    }
}

extension ProductCollectionViewManager: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        updatePage?(page)
    }
}
