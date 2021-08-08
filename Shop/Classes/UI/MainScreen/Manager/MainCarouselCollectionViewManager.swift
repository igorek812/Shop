//
//  MainCollectionViewManager.swift
//  Shop
//
//  Created by Евгений Прохоров on 06.07.2021.
//

import UIKit

final class MainCarouselCollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var cellModels: [MainCarouselCellModel] = []
    
    func set(cellModels: [MainCarouselCellModel]) {
        self.cellModels = cellModels
    }
    
    var updatePage: ((Int) -> Void)?
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat = collectionView.frame.height
        let width = collectionView.frame.width
        
        return CGSize(width: width, height: height)
    }
    
}

extension MainCarouselCollectionViewManager: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        updatePage?(page)
    }
}


