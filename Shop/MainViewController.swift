//
//  MainViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 06.07.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    @IBOutlet weak var carouselPageControl: UIPageControl!
    
    let carouselCellModels = [
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "CarouselPhoto1"), name: "First Photo"),
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "CarouselPhoto1"), name: "2 Photo"),
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "CarouselPhoto1"), name: "3 Photo"),
        MainCarouselCellModel.init(image: #imageLiteral(resourceName: "CarouselPhoto1"), name: "4 Photo"),
    ]
    
    let menuCellModels = [
        MainMenuCellModel.init(image: #imageLiteral(resourceName: "menu"), name: "New"),
        MainMenuCellModel.init(image: #imageLiteral(resourceName: "menu"), name: "New"),
        MainMenuCellModel.init(image: #imageLiteral(resourceName: "menu"), name: "New"),
        MainMenuCellModel.init(image: #imageLiteral(resourceName: "menu"), name: "New"),
        MainMenuCellModel.init(image: #imageLiteral(resourceName: "menu"), name: "New"),
        MainMenuCellModel.init(image: #imageLiteral(resourceName: "menu"), name: "New")
    ]
    
    var mainCollectionViewManager: MainCollectionViewManager?
    
    var mainMenuCollectionViewManager: MainMenuCollectionViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIImage(named: "logo.png")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        carouselCollectionView.delegate = self
        mainCollectionViewManager = MainCollectionViewManager.init()
        
        carouselCollectionView.dataSource = mainCollectionViewManager
        
        mainCollectionViewManager?.set(cellModels: carouselCellModels)
        carouselCollectionView.reloadData()
        
        carouselPageControl.numberOfPages = carouselCellModels.count
        
        menuCollectionView.delegate = self
        mainMenuCollectionViewManager = MainMenuCollectionViewManager.init()
        
        menuCollectionView.dataSource = mainMenuCollectionViewManager
        
        mainMenuCollectionViewManager?.set(cellModels: menuCellModels)
        menuCollectionView.reloadData()
    }


}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == carouselCollectionView {
            let height: CGFloat = 200
            let width = collectionView.frame.width
            
            return CGSize(width: width, height: height)
        }
        else if collectionView == menuCollectionView {
            let height: CGFloat = 200
            let width = collectionView.frame.width / 2 - 20
            
            return CGSize(width: width, height: height)
        }
        
        return CGSize()
    }
        
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        carouselPageControl.currentPage = page
    }
}


