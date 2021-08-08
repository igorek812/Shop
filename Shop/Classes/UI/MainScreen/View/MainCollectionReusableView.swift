//
//  MainCollectionReusableView.swift
//  Shop
//
//  Created by Евгений Прохоров on 11.07.2021.
//

import UIKit

class MainCollectionReusableView: UICollectionReusableView, UICollectionViewDelegate {
        
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    @IBOutlet weak var carouselPageControl: UIPageControl!
    
    let carouselCellModels = [
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "carousel4")),
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "carousel1")),
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "carousel3")),
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "carousel2"))
    ]

    var mainCarouselCollectionViewManager: MainCarouselCollectionViewManager?
    
}

extension MainCollectionReusableView {
    
   func carouselInit() {
        mainCarouselCollectionViewManager = MainCarouselCollectionViewManager.init()
        carouselCollectionView.delegate = mainCarouselCollectionViewManager
        carouselCollectionView.dataSource = mainCarouselCollectionViewManager
        
        mainCarouselCollectionViewManager?.set(cellModels: carouselCellModels)
        mainCarouselCollectionViewManager?.updatePage = { [weak self] page in
            self?.carouselPageControl.currentPage = page
        }
        carouselCollectionView.reloadData()
        
        carouselPageControl.numberOfPages = carouselCellModels.count
    }
}



