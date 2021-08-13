//
//  FavouriteTableViewCell.swift
//  Shop
//
//  Created by Евгений Прохоров on 25.07.2021.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var addToBagButton: ProductModel?
    
    func configureCell(cellModel: ProductModel) {
        categoryLabel.text = cellModel.category.rawValue
        nameLabel.text = cellModel.name
        priceLabel.text = cellModel.price
        productImage.image = cellModel.image[0].image
        addToBagButton = cellModel
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
