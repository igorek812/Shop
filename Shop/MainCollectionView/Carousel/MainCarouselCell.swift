//
//  MainCarouselCell.swift
//  Shop
//
//  Created by Евгений Прохоров on 06.07.2021.
//

import UIKit

final class MainCarouselCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var blurView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    func configureCell(cellModel: MainCarouselCellModel) {
        imageView.image = cellModel.image
        nameLabel.text = cellModel.name
    }
    
}
