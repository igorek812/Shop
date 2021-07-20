//
//  MainViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 06.07.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var menuCollectionView: UICollectionView!

    let menuCellModels = [
        CatalogModel.init(image: #imageLiteral(resourceName: "menu6"), title: "Новинки"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu7"), title: "Одежда для спорта"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu8"), title: "Купальники и белье"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu1"), title: "Спортивные костюмы"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu2"), title: "Брюки, джеггинсы, юбки"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu5"), title: "Топы, корсеты"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu4"), title: "Фитнес резинки"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu3"), title: "Скидки")
        
    ]
    
    var mainHeaderSection: MainCollectionReusableView?
    
    var mainMenuCollectionViewManager: MainMenuCollectionViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIImage(named: "logo.png")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView

        
        menuCollectionView.delegate = self
        mainMenuCollectionViewManager = MainMenuCollectionViewManager.init()
        
        menuCollectionView.dataSource = mainMenuCollectionViewManager
        
        mainMenuCollectionViewManager?.set(cellModels: menuCellModels)
        menuCollectionView.reloadData()
        
        mainHeaderSection?.carouselInit()
        
     //   print(mainHeaderSection?.carouselCellModels.count)
        
    }


}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainHeaderSection?.carouselCollectionView {
            let height: CGFloat = 200
            let width = collectionView.frame.width
            
            return CGSize(width: width, height: height)
        }
        else if collectionView == menuCollectionView {
            let height: CGFloat = 200
            let width = collectionView.frame.width / 2 - 10
            
            return CGSize(width: width, height: height)
        }
        
        return CGSize()
    }
        
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        mainHeaderSection?.carouselPageControl.currentPage = page
    }
}


