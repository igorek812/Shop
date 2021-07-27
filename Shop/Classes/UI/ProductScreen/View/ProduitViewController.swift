//
//  ProduitViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 17.07.2021.
//

import UIKit

class ProduitViewController: UIViewController {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var productCollectionViewManager: ProductCollectionViewManager?
    
    var product = AssortmentModel.init(image: #imageLiteral(resourceName: "shorts"), name: "Моделирующие шорты с боковым карманом (W4/1)", price: "3800P", article: "Артикул: W4/1-08163-40-(XS)", category: .pants)
    
    var imageProduct: [ProductImageModel] = [
        ProductImageModel.init(image:  #imageLiteral(resourceName: "menu7") ),
        ProductImageModel.init(image: #imageLiteral(resourceName: "menu1")),
        ProductImageModel.init(image: #imageLiteral(resourceName: "menu3"))
    ]
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var bagButton: UIButton!
    @IBOutlet weak var favouriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    @IBAction func bagButtonTapped(_ sender: Any) {
        BacketData.shared.addProductToBag(product: product)
    }
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        
        let starFill = UIImage(systemName: "star.fill")
        let star = UIImage(systemName: "star")
        if favouriteButton.imageView?.image == starFill {
            favouriteButton.setImage(star, for: .normal)
            BacketData.shared.removeProductInFavourite(product: product)
        }
        else {
            favouriteButton.setImage(starFill, for: .normal)
            BacketData.shared.addProductInFavourite(product: product)
        }
    }
    private func setup() {
        
        productCollectionViewManager = ProductCollectionViewManager.init()
        productCollectionView.delegate = productCollectionViewManager
        productCollectionView.dataSource = productCollectionViewManager
        productCollectionViewManager?.set(imageProduct: imageProduct)
        productCollectionView.reloadData()
        
        //produitImageView.image = product.image
        categoryLabel.text = product.category.rawValue
        nameLabel.text = product.name
        priceLabel.text = product.price
        articleLabel.text = product.article
    }

}
