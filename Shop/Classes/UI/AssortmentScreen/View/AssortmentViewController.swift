//
//  AssortmentViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 11.07.2021.
//

import UIKit

class AssortmentViewController: UIViewController {
    
    @IBOutlet weak var assortmentCollectionView: UICollectionView!
    
    public var category: AssortmentCategory?
    
    private var assortmentCategory: [ProductModel] = []
    private let assortimentService = AssortimentService()
    private var assortmentManager: AssortmentCollectionViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
    }
    
}

private extension AssortmentViewController {
    
    private func setupNavBar() {
        navigationItem.title = category?.rawValue
    }
    
    private func setupTableView() {
        
        if let category = category {
            assortmentCategory = assortimentService.getItemsBy(category: category)
        }
        
        assortmentManager = AssortmentCollectionViewManager()
        assortmentCollectionView.delegate = assortmentManager
        assortmentCollectionView.dataSource = assortmentManager
        
        assortmentManager?.set(assortment: assortmentCategory)
        assortmentCollectionView.reloadData()
        
        assortmentManager?.didSelect = { cell in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let produitViewController = storyboard.instantiateViewController(identifier: "ProductVC") as? ProduitViewController else { return }
            produitViewController.product = cell
            self.show(produitViewController, sender: nil)
        }
    }
}
