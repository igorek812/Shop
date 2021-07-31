//
//  MainMenuCell.swift
//  Shop
//
//  Created by Евгений Прохоров on 09.07.2021.
//

import UIKit

class MainMenuCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var opacityView: UIView!
    
    func configureCell(cellModel: CatalogViewModel) {
        imageView.image = cellModel.item.image
        nameLabel.text = cellModel.item.title
        opacityView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
    }
}
