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
    
    var product = ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "CarouselPhoto1"))],
                                    name: "RTR", price: "34400", article: "fgdfg",
                                    color: [ColorModel.init(color: UIColor(red: 255, green: 234, blue: 133, alpha: 1))], size: [SizeModel.init(size: "42(S)")],
                                    category: .new)
    
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
            
            productImageVC.image = image
            self.show(productImageVC, sender: nil)
            
            
        }
    }

}
