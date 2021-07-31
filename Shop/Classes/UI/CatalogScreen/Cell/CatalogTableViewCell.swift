//
//  CatalogTableViewCell.swift
//  Shop
//
//  Created by Евгений Прохоров on 10.07.2021.
//

import UIKit

class CatalogTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configureCell(cellModel: CatalogViewModel) {
        
        nameLabel.text = cellModel.item.title
        backgroundImageView.image = cellModel.item.image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
