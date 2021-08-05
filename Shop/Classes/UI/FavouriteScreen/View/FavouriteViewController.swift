//
//  FavouriteViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 25.07.2021.
//

import UIKit

final class FavouriteViewController: UIViewController {
    
    @IBOutlet weak var favouriteTableView: UITableView!
    
    @IBOutlet weak var entityFavouriteLabel: UILabel!
    
    var favouriteTableViewManager: FavouriteTableViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if BacketData.shared.favouriteProducts.isEmpty {
            favouriteTableView.isHidden = false
            entityFavouriteLabel.isHidden = true
            favouriteTableViewManager?.set(favouriteProduits: BacketData.shared.favouriteProducts)
            favouriteTableView.reloadData()
        }
        else {
            favouriteTableView.isHidden = true
        }
    }
}

extension FavouriteViewController {
    
    func setupTableView() {
        
        favouriteTableView.separatorStyle = .none
        favouriteTableViewManager = FavouriteTableViewManager.init()
        favouriteTableView.delegate = favouriteTableViewManager
        
        favouriteTableView.dataSource = favouriteTableViewManager
        
        favouriteTableViewManager?.didSelect = { favourite in
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            guard let productVC = storyboard.instantiateViewController(identifier: "ProductVC") as? ProduitViewController else { return }
            productVC.product = favourite
            self.show(productVC, sender: nil)
        }
    }
}
