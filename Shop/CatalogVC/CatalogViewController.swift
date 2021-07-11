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
        CatalogModel.init(image: #imageLiteral(resourceName: "menu6"), title: "Новинки"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu7"), title: "Одежда для спорта"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu8"), title: "Купальники и белье"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu1"), title: "Спортивные костюмы"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu2"), title: "Брюки, джеггинсы, юбки"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu5"), title: "Топы, корсеты"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu4"), title: "Фитнес резинки"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu3"), title: "Скидки")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catalogTableViewManager = CatalogTableViewManager.init()
        
        catalogTableView.dataSource = catalogTableViewManager
        
        catalogTableViewManager?.set(cellModels: catalogCellModel)
        catalogTableView.reloadData()
        

    }

}

