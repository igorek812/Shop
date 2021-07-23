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
    
    private var assortmentCategory: [AssortmentModel] = []
    private let assortimentService = AssortimentService()
    private var assortmentManager: AssortmentCollectionViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
    }
    
}

private extension AssortmentViewController {
    
    func setupNavBar() {
        navigationController?.title = category?.rawValue
    }
    
    func setupTableView() {
        
        if let category = category {
            assortmentCategory = assortimentService.getItemsBy(category: category)
        }
        
        assortmentManager = AssortmentCollectionViewManager()
        assortmentCollectionView.delegate = assortmentManager
        assortmentCollectionView.dataSource = assortmentManager
        
        assortmentManager?.set(assortment: assortmentCategory)
        //assortmentCollectionView.reloadData()
    }
}

extension AssortmentViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat = collectionView.frame.height / 2 - 10
        let width = collectionView.frame.width / 2 - 10
        
        return CGSize(width: width, height: height)
    }
}
