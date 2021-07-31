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
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "CarouselPhoto1")),
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "CarouselPhoto1")),
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "CarouselPhoto1")),
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "CarouselPhoto1"))
    ]

    var mainCarouselCollectionViewManager: MainCarouselCollectionViewManager?
    
    func carouselInit() {
        mainCarouselCollectionViewManager = MainCarouselCollectionViewManager.init()
        carouselCollectionView.delegate = mainCarouselCollectionViewManager
        
        carouselCollectionView.dataSource = mainCarouselCollectionViewManager
        
        mainCarouselCollectionViewManager?.set(cellModels: carouselCellModels )
        carouselCollectionView.reloadData()
        
        carouselPageControl.numberOfPages = carouselCellModels.count
    }
}

extension MainCollectionReusableView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        carouselPageControl.currentPage = page
    }
}

