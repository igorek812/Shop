//
//  FavouriteViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 25.07.2021.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    @IBOutlet weak var favouriteTableView: UITableView!
    
    var favouriteTableViewManager: FavouriteTableViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favouriteTableViewManager?.set(favouriteProduits: BacketData.shared.favouriteProducts)
        favouriteTableView.reloadData()
    }
    
    func setupTableView() {
        favouriteTableViewManager = FavouriteTableViewManager.init()
        favouriteTableView.delegate = favouriteTableViewManager
        
        favouriteTableView.dataSource = favouriteTableViewManager
    }
    
}
