//
//  ProduitViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 17.07.2021.
//

import UIKit

class ProduitViewController: UIViewController {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    @IBOutlet weak var colorCollectionView: UICollectionView!
    
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    
    var productCollectionViewManager: ProductCollectionViewManager?
    var sizeCollectionViewManager: SizeCollectionViewManager?
    var colorCollectionViewManager: ColorCollectionViewManager?
    
    var product: ProductModel?
    
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
        
        guard let product = product else { return }
        BacketData.shared.addProductToBag(product: product)
    }
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        
        guard let product = product else { return }
        
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

}

private extension ProduitViewController {
    
    private func setup() {
        
        guard let product = product else { return }
        
        productCollectionViewManager = ProductCollectionViewManager.init()
        productCollectionView.delegate = productCollectionViewManager
        productCollectionView.dataSource = productCollectionViewManager
        productCollectionViewManager?.set(imageProduct: [product.image[0]])
        productCollectionView.reloadData()
        
        sizeCollectionViewManager = SizeCollectionViewManager.init()
        sizeCollectionView.delegate = sizeCollectionViewManager
        sizeCollectionView.dataSource = sizeCollectionViewManager
        sizeCollectionViewManager?.set(product: product)
        sizeCollectionView.reloadData()
        
        colorCollectionViewManager = ColorCollectionViewManager.init()
        colorCollectionView.delegate = colorCollectionViewManager
        colorCollectionView.dataSource = colorCollectionViewManager
        colorCollectionViewManager?.set(product: product)
        colorCollectionView.reloadData()
        
        categoryLabel.text = product.category.rawValue
        nameLabel.text = product.name
        priceLabel.text = product.price
        articleLabel.text = product.article
        
        productCollectionViewManager?.didSelect = { image in
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            guard let productImageVC = storyboard.instantiateViewController(identifier: "ProductImageView") as? ProductImageViewController else { return }
            productImageVC.modalPresentationStyle = .pageSheet
            productImageVC.modalTransitionStyle = .partialCurl
            productImageVC.image = image
            self.show(productImageVC, sender: nil)
            
            
        }
    }
}
