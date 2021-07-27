//
//  AssortmentCollectionViewCell.swift
//  Shop
//
//  Created by Евгений Прохоров on 11.07.2021.
//

import UIKit

class AssortmentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    var product: ProductModel?
    
    func configureCell(assortmentCell: ProductModel) {
        itemImage.image = assortmentCell.image[0].image
        categoryLabel.text = assortmentCell.category.rawValue
        nameLabel.text = assortmentCell.name
        priceLabel.text = assortmentCell.price
        product = assortmentCell
    }
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        
        let starFill = UIImage(systemName: "star.fill")
        let star = UIImage(systemName: "star")
        if favouriteButton.imageView?.image == starFill {
            favouriteButton.setImage(star, for: .normal)
            BacketData.shared.removeProductInFavourite(product: product!)
        }
        else {
            favouriteButton.setImage(starFill, for: .normal)
            BacketData.shared.addProductInFavourite(product: product!)
        }
    }
}
