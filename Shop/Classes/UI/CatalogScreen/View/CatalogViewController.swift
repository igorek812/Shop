//
//  CatalogViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 10.07.2021.
//

import UIKit

class CatalogViewController: UIViewController {

    @IBOutlet weak var catalogTableView: UITableView!
    
    var catalogTableViewManager: CatalogTableViewManager?
    
    let catalogCellModel = [
        CatalogViewModel.init(category: .new, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu6"), title: "Новинки")),
        CatalogViewModel.init(category: .sport, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu7"), title: "Одежда для спорта")),
        CatalogViewModel.init(category: .swimsuit, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu8"), title: "Купальники и белье")),
        CatalogViewModel.init(category: .tracksuits, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu1"), title: "Спортивные костюмы")),
        CatalogViewModel.init(category: .pants, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu2"), title: "Брюки, джеггинсы, юбки")),
        CatalogViewModel.init(category: .tops, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu5"), title: "Топы, корсеты")),
        CatalogViewModel.init(category: .fitnessRubberBands, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu4"), title: "Фитнес резинки")),
        CatalogViewModel.init(category: .sales, item: CatalogModel.init(image: #imageLiteral(resourceName: "menu3"), title: "Новинки"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catalogTableViewManager = CatalogTableViewManager.init()
        catalogTableView.delegate = catalogTableViewManager
        
        catalogTableView.dataSource = catalogTableViewManager
        
        catalogTableViewManager?.set(cellModels: catalogCellModel)
        catalogTableView.reloadData()
        
        
        catalogTableViewManager?.didSelect = { category in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let assortmentViewController = storyboard.instantiateViewController(identifier: "AssortmentViewController") as? AssortmentViewController else { return }
            assortmentViewController.category = category
            self.show(assortmentViewController, sender: nil)
        }

    }

}

