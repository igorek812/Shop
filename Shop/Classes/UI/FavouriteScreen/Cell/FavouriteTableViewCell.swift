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
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var bagButton: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    
    var addToBagButton: AssortmentModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func bagButtonTapped(_ sender: Any) {
        BacketData.shared.addProductToBag(product: addToBagButton!)
    }
}
