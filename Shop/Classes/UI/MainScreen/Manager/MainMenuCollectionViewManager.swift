//
//  MainMenuCollectionViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 23.07.2021.
//

import UIKit

final class MainMenuCollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var cellModels: [CatalogViewModel] = []
    
    func set(cellModels: [CatalogViewModel]) {
        self.cellModels = cellModels
    }
    
    var didSelect: ((AssortmentCategory) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainMenuCollectionCell", for: indexPath) as? MainMenuCell {
            
            cell.configureCell(cellModel: cellModels[indexPath.row])
            
            return cell
        }
        
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            
            if let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MenuHeader", for: indexPath) as? MainCollectionReusableView {
                cell.carouselInit()
                return cell
            }
            
            return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelect?(cellModels[indexPath.row].category)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat = 200
        let width = collectionView.frame.width / 2 - 10
        
        return CGSize(width: width, height: height)
    }
    
}
