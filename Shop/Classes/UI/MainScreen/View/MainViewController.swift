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
        CatalogViewModel.init(category: .new, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu6"), title: "Новинки")),
        CatalogViewModel.init(category: .sport, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu7"), title: "Одежда для спорта")),
        CatalogViewModel.init(category: .swimsuit, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu8"), title: "Купальники и белье")),
        CatalogViewModel.init(category: .tracksuits, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu1"), title: "Спортивные костюмы")),
        CatalogViewModel.init(category: .pants, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu2"), title: "Брюки, джеггинсы, юбки")),
        CatalogViewModel.init(category: .tops, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu5"), title: "Топы, корсеты")),
        CatalogViewModel.init(category: .fitnessRubberBands, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu4"), title: "Фитнес резинки")),
        CatalogViewModel.init(category: .sales, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu3"), title: "Новинки"))
    ]
    
    var mainHeaderSection: MainCollectionReusableView?
    
    var mainMenuCollectionViewManager: MainMenuCollectionViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIImage(named: "logo.png")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView

        setCollectionView()
    }

}

private extension MainViewController {
    
    private func setCollectionView() {
        mainMenuCollectionViewManager = MainMenuCollectionViewManager.init()
        menuCollectionView.delegate = mainMenuCollectionViewManager
        
        menuCollectionView.dataSource = mainMenuCollectionViewManager
        
        mainMenuCollectionViewManager?.set(cellModels: menuCellModels)
        menuCollectionView.reloadData()
        
        mainHeaderSection?.carouselInit()
        
        mainMenuCollectionViewManager?.didSelect = { category in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let assortmentViewController = storyboard.instantiateViewController(identifier: "AssortmentViewController") as? AssortmentViewController else { return }
            assortmentViewController.category = category
            self.show(assortmentViewController, sender: nil)
        }
    }
    
}


