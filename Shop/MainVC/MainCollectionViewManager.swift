//
//  MainCollectionViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 06.07.2021.
//

import UIKit

final class MainCollectionViewManager: NSObject, UICollectionViewDataSource {
    
    private var cellModels: [MainCarouselCellModel] = []
    
    func set(cellModels: [MainCarouselCellModel]) {
        self.cellModels = cellModels
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCarouselCell", for: indexPath) as? MainCarouselCell {
            
            cell.configureCell(cellModel: cellModels[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell.init()
    }
    
    
}

final class MainMenuCollectionViewManager: NSObject, UICollectionViewDataSource {
    
    private var cellModels: [CatalogModel] = []
    
    func set(cellModels: [CatalogModel]) {
        self.cellModels = cellModels
    }
    
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
    
    
}

