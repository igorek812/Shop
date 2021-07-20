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
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "CarouselPhoto1"), name: "First Photo"),
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "CarouselPhoto1"), name: "2 Photo"),
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "CarouselPhoto1"), name: "3 Photo"),
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "CarouselPhoto1"), name: "4 Photo")
    ]

    var mainCollectionViewManager: MainCollectionViewManager?
    
    func carouselInit() {
        carouselCollectionView.delegate = self
        mainCollectionViewManager = MainCollectionViewManager.init()
        
        carouselCollectionView.dataSource = mainCollectionViewManager
        
        mainCollectionViewManager?.set(cellModels: carouselCellModels )
        carouselCollectionView.reloadData()
        
        carouselPageControl.numberOfPages = carouselCellModels.count
    }
}
