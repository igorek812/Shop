//
//  BagViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 27.07.2021.
//

import UIKit

class BagViewController: UIViewController {

    @IBOutlet weak var bagTableView: UITableView!
    
    @IBOutlet weak var entityBagLabel: UILabel!
    
    var bagTableViewManager = BagTableViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if BacketData.shared.productInBag.count != 0 {
            bagTableView.isHidden = false
            entityBagLabel.isHidden = true
            bagTableViewManager.set(productInBag: BacketData.shared.productInBag)
            bagTableView.reloadData()
        }
        else {
            bagTableView.isHidden = true
        }
    }
    
    func setupTableView() {
        
        bagTableView.separatorStyle = .none
        bagTableViewManager = BagTableViewManager.init()
        bagTableView.delegate = bagTableViewManager
        bagTableView.dataSource = bagTableViewManager
    }
}
