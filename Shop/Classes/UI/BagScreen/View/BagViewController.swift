//
//  BagViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 27.07.2021.
//

import UIKit

class BagViewController: UIViewController {
    
    var countProducts = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    @IBOutlet weak var bagTableView: UITableView!
    
    @IBOutlet weak var entityBagLabel: UILabel!
    
    var bagTableViewManager = BagTableViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    @IBAction func countButtonsTapped(_ sender: Any) {
        bagTableViewManager.didSelect = { index in
            BacketData.shared.productInBag[index].count = 10
        }
        bagTableView.reloadData()
        print(BacketData.shared.productInBag)
    }
    override func viewWillAppear(_ animated: Bool) {
        let productInBag = BacketData.shared.productInBag
        if !productInBag.isEmpty {
            updateBagBadge(badge: String(productInBag.count))
            bagTableView.isHidden = false
            entityBagLabel.isHidden = true
            bagTableViewManager.set(productInBag: productInBag)
            bagTableView.reloadData()
        }
        else {
            bagTableView.isHidden = true
        }
    }
}

extension BagViewController {
    
    func setupTableView() {
        bagTableView.separatorStyle = .none
        bagTableViewManager = BagTableViewManager.init()
        bagTableView.delegate = bagTableViewManager
        bagTableView.dataSource = bagTableViewManager
    }
}
