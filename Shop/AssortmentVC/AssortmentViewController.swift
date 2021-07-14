//
//  AssortmentViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 11.07.2021.
//

import UIKit

class AssortmentViewController: UIViewController {

    
    @IBOutlet weak var assortmentCollectionView: UICollectionView!
    
    let assortmentModel: [AssortmentModel] = [
        AssortmentModel.init(image: #imageLiteral(resourceName: "shorts"), name: "Моделирующие шорты с боковым карманом (W4/1)", price: "3800P", category: "Велосипедки и шорты"),
        AssortmentModel.init(image: #imageLiteral(resourceName: "shorts"), name: "Моделирующие шорты с боковым карманом (W4/1)", price: "3800P", category: "Велосипедки и шорты"),
        AssortmentModel.init(image: #imageLiteral(resourceName: "shorts"), name: "Моделирующие шорты с боковым карманом (W4/1)", price: "3800P", category: "Велосипедки и шорты"),
        AssortmentModel.init(image: #imageLiteral(resourceName: "shorts"), name: "Моделирующие шорты с боковым карманом (W4/1)", price: "3800P", category: "Велосипедки и шорты"),
        AssortmentModel.init(image: #imageLiteral(resourceName: "shorts"), name: "Моделирующие шорты с боковым карманом (W4/1)", price: "3800P", category: "Велосипедки и шорты"),
        AssortmentModel.init(image: #imageLiteral(resourceName: "shorts"), name: "Моделирующие шорты с боковым карманом (W4/1)", price: "3800P", category: "Велосипедки и шорты")
    ]
    
    var assortmentManager: AssortmentCollectionViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assortmentCollectionView.delegate = self
        assortmentManager = AssortmentCollectionViewManager.init()
        
        assortmentCollectionView.dataSource = assortmentManager
        assortmentManager?.set(assortment: assortmentModel)
        
        assortmentCollectionView.reloadData()
        
    }
    
}

extension AssortmentViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat = 200
        let width = collectionView.frame.width
        
        return CGSize(width: width, height: height)
    }
}
