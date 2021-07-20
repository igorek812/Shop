//
//  AssortmentViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 11.07.2021.
//

import UIKit

class AssortmentViewController: UIViewController {

    
    @IBOutlet weak var assortmentCollectionView: UICollectionView!
    
    let assortmentModel: [AssortmentModel] = []
    
    var assortmentManager: AssortmentCollectionViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assortmentManager = AssortmentCollectionViewManager.init()
        assortmentCollectionView.delegate = assortmentManager
        
        assortmentCollectionView.dataSource = assortmentManager
        print(navigationController?.title ?? "nil")
        for i in assortmentModel {
            if i.category == navigationController?.title {
                assortmentManager?.set(assortment: assortmentModel)
            
                assortmentCollectionView.reloadData()
    
            }
        }
        assortmentCollectionView.reloadData()
        print(navigationController?.title ?? "nil")
    }
    
}

extension AssortmentViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat = collectionView.frame.height / 2 - 10
        let width = collectionView.frame.width / 2 - 10
        
        return CGSize(width: width, height: height)
    }
}
