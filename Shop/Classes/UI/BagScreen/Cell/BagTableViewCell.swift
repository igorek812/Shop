//
//  BagTableViewCell.swift
//  Shop
//
//  Created by Евгений Прохоров on 27.07.2021.
//

import UIKit

class BagTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configureCell(cellModel: ProductModel) {
        productImage.image = cellModel.image[0].image
        nameLabel.text = cellModel.name
        colorLabel.backgroundColor = cellModel.color[0].color
        colorLabel.text = ""
        priceLabel.text = cellModel.price
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
