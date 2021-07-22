//
//  AssortmentViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 11.07.2021.
//

import UIKit

class AssortmentViewController: UIViewController {

    
    @IBOutlet weak var assortmentCollectionView: UICollectionView!
    
    let assortmentCategory: [AssortmentModel] = [
        AssortmentModel.init(image: #imageLiteral(resourceName: "menu4"), name: "Жопа", price: "3500", category: .new),
        AssortmentModel.init(image: #imageLiteral(resourceName: "menu4"), name: "Жопа2", price: "3500", category: .new),
        AssortmentModel.init(image: #imageLiteral(resourceName: "menu4"), name: "Жопа3", price: "3500", category: .pants),
        AssortmentModel.init(image: #imageLiteral(resourceName: "menu4"), name: "Жопа4", price: "3500", category: .sales),
        AssortmentModel.init(image: #imageLiteral(resourceName: "menu4"), name: "Жопа5", price: "3500", category: .tops)
    ]
    var assortmentManager: AssortmentCollectionViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(assortmentCategory)
        navigationController?.title = assortmentCategory
        assortmentManager = AssortmentCollectionViewManager.init()
        assortmentCollectionView.delegate = assortmentManager
        
        assortmentCollectionView.dataSource = assortmentManager
        //assortmentManager?.set(assortment: assortmentCategory)
    
        assortmentCollectionView.reloadData()
    }
    
}

extension AssortmentViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat = collectionView.frame.height / 2 - 10
        let width = collectionView.frame.width / 2 - 10
        
        return CGSize(width: width, height: height)
    }
}
