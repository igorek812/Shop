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
    
    private func checkFavouriteButton() {
        
        let starFill = UIImage(systemName: "star.fill")
        let star = UIImage(systemName: "star")
        
        if BacketData.shared.favouriteProducts.contains(where: { item in
            item.id == product?.id
        }) {
            favouriteButton.setBackgroundImage(starFill, for: .normal)
        } else {
            favouriteButton.setBackgroundImage(star, for: .normal)
        }
    }
    
    func configureCell(assortmentCell: ProductModel) {
        itemImage.image = assortmentCell.image[0].image
        categoryLabel.text = assortmentCell.category[0].rawValue
        nameLabel.text = assortmentCell.name
        nameLabel.sizeToFit()
        priceLabel.text = "\(assortmentCell.price) руб."
        product = assortmentCell
        checkFavouriteButton()
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
