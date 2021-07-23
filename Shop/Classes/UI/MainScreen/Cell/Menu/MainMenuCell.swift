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
    
    func configureCell(cellModel: CatalogModel) {
        imageView.image = cellModel.image
        nameLabel.text = cellModel.title
    }
}
