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
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    func configureCell(cellModel: BagModel) {
        productImage.image = cellModel.product.image[0].image
        nameLabel.text = cellModel.product.name
        colorLabel.text = "Цвет: " + cellModel.selectedColor
        sizeLabel.text = "Размер: " + cellModel.selectedSize
        priceLabel.text = cellModel.product.price
        articleLabel.text = cellModel.product.article[0].article
        countLabel.text = String(cellModel.count)
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
