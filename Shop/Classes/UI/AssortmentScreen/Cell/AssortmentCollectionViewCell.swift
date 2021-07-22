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
    
    func configureCell(assortmentCell: AssortmentModel) {
        itemImage.image = assortmentCell.image
        categoryLabel.text = assortmentCell.category.rawValue
        nameLabel.text = assortmentCell.name
        priceLabel.text = assortmentCell.price
    }
}
