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
        AssortmentSectionModel.init(category: <#T##AssortmentCategory#>, items: <#T##[CatalogModel]#>)
//        AssortmentSectionModel.init(category: #imageLiteral(resourceName: "menu7"), items: "Одежда для спорта"),
//        AssortmentSectionModel.init(category: #imageLiteral(resourceName: "menu8"), items: "Купальники и белье"),
//        AssortmentSectionModel.init(category: #imageLiteral(resourceName: "menu1"), items: "Спортивные костюмы"),
//        AssortmentSectionModel.init(category: #imageLiteral(resourceName: "menu2"), items: "Брюки, джеггинсы, юбки"),
//        AssortmentSectionModel.init(category: #imageLiteral(resourceName: "menu5"), items: "Топы, корсеты"),
//        AssortmentSectionModel.init(category: #imageLiteral(resourceName: "menu4"), items: "Фитнес резинки"),
//        AssortmentSectionModel.init(category: #imageLiteral(resourceName: "menu3"), items: "Скидки")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catalogTableViewManager = CatalogTableViewManager.init()
        catalogTableView.delegate = catalogTableViewManager
        
        catalogTableView.dataSource = catalogTableViewManager
        
        catalogTableViewManager?.set(cellModels: catalogCellModel)
        catalogTableView.reloadData()
        
        
        catalogTableViewManager?.didSelect = { cell in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let assortmentViewController = storyboard.instantiateViewController(identifier: "AssortmentViewController") as? AssortmentViewController else { return }
            assortmentViewController.navigationItem.title = self.catalogCellModel[cell].title

            self.show(assortmentViewController, sender: nil)
        }

    }

}

