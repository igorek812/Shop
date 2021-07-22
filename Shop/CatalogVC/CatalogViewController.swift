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
        AssortmentSectionModel.init(category: .new, items: [CatalogModel.init(image: #imageLiteral(resourceName: "menu6"), title: "Новинки")]),
        AssortmentSectionModel.init(category: .sport, items: [CatalogModel.init(image: #imageLiteral(resourceName: "menu7"), title: "Одежда для спорта")]),
        AssortmentSectionModel.init(category: .swimsuit, items: [CatalogModel.init(image: #imageLiteral(resourceName: "menu8"), title: "Купальники и белье")]),
        AssortmentSectionModel.init(category: .tracksuits, items: [CatalogModel.init(image: #imageLiteral(resourceName: "menu1"), title: "Спортивные костюмы")]),
        AssortmentSectionModel.init(category: .pants, items: [CatalogModel.init(image: #imageLiteral(resourceName: "menu2"), title: "Брюки, джеггинсы, юбки")]),
        AssortmentSectionModel.init(category: .tops, items: [CatalogModel.init(image: #imageLiteral(resourceName: "menu5"), title: "Топы, корсеты")]),
        AssortmentSectionModel.init(category: .fitnessRubberBands, items: [CatalogModel.init(image: #imageLiteral(resourceName: "menu4"), title: "Фитнес резинки")]),
        AssortmentSectionModel.init(category: .sales, items: [CatalogModel.init(image: #imageLiteral(resourceName: "menu3"), title: "Новинки")])
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
            assortmentViewController.assortmentCategory = self.catalogCellModel[cell].category
            self.show(assortmentViewController, sender: nil)
        }

    }

}

