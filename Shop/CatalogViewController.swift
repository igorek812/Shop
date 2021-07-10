//
//  CatalogViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 10.07.2021.
//

import UIKit

class CatalogViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var catalogTableView: UITableView!
    
    var catalogTableViewManager: CatalogTableViewManager?
    
    
    
    let catalogCellModel = [
        CatalogModel.init(image: #imageLiteral(resourceName: "menu"), title: "Новинки"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu"), title: "Одежда для спорта"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu"), title: "Купальники и белье"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu"), title: "Спортивные костюмы"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu"), title: "Брюки, джеггинсы, юбки"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu"), title: "Топы, корсеты"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu"), title: "Фитнес резинки"),
        CatalogModel.init(image: #imageLiteral(resourceName: "menu"), title: "Скидки")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catalogTableView.delegate = self
        catalogTableViewManager = CatalogTableViewManager.init()
        
        catalogTableView.dataSource = catalogTableViewManager
        
        catalogTableViewManager?.set(cellModels: catalogCellModel)
        catalogTableView.reloadData()
        

    }

}

