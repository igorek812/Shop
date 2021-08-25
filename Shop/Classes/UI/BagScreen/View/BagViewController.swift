//
//  BagViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 27.07.2021.
//

import UIKit

class BagViewController: UIViewController {

    var bagTableViewManager = BagTableViewManager()
    var totalPrice: Int = 0
    @IBOutlet weak var bagTableView: UITableView!
    
    @IBOutlet weak var entityBagLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        totalPriceLabel.text = "Итого: \(totalPrice)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let productInBag = BacketData.shared.productInBag
        if !productInBag.isEmpty {
            tabBarController?.tabBar.updateBagBadge(badge: "\(BacketData.shared.countProductInBag)")
            bagTableView.isHidden = false
            entityBagLabel.isHidden = true
            bagTableViewManager.set(productInBag: productInBag)
            bagTableViewManager.updateTotalPrice = { [weak self] cellsInBag, indexItem in
                var totalPrice = 0
                for i in cellsInBag {
                    totalPrice += i.product.price * i.count
                }
                self?.totalPrice = totalPrice
                if cellsInBag.count < 2 {
                    self?.totalPriceLabel.text = "Итого: \(cellsInBag.count) позиция на сумму \(self?.totalPrice ?? 0) руб."
                } else {
                    self?.totalPriceLabel.text = "Итого: \(cellsInBag.count) позиции на сумму \(self?.totalPrice ?? 0) руб"
                }
                
            }
            bagTableViewManager.updateBadge = { [weak self] productInBag in
                if productInBag.count == 0 {
                    self?.tabBarController?.tabBar.items?[2].badgeValue = .none
                } else {
                    self?.tabBarController?.tabBar.updateBagBadge(badge: "\(productInBag.count)")
                }
            }
            bagTableView.reloadData()
        }
        else {
            bagTableView.isHidden = true
        }
    }
    
    @IBAction func orderButtonTapped(_ sender: Any) {
    }
}

extension BagViewController {
    
    func setupTableView() {
        bagTableView.separatorStyle = .none
        bagTableViewManager = BagTableViewManager.init()
        bagTableView.delegate = bagTableViewManager
        bagTableView.dataSource = bagTableViewManager
        bagTableViewManager.updateCellBy = { cellIndex in
            self.bagTableView.reloadRows(at: [cellIndex], with: .automatic)
        }
    }
}
