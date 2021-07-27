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

    var mainCarouselCollectionViewManager: MainCarouselCollectionViewManager?
    
    func carouselInit() {
        carouselCollectionView.delegate = self
        mainCarouselCollectionViewManager = MainCarouselCollectionViewManager.init()
        
        carouselCollectionView.dataSource = mainCarouselCollectionViewManager
        
        mainCarouselCollectionViewManager?.set(cellModels: carouselCellModels )
        carouselCollectionView.reloadData()
        
        carouselPageControl.numberOfPages = carouselCellModels.count
    }
}

extension MainCollectionReusableView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 200
        let width = collectionView.frame.width
        
        return CGSize(width: width, height: height)
    }
}

extension MainCollectionReusableView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        carouselPageControl.currentPage = page
    }
}
