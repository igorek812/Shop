//
//  MainCarouselCell.swift
//  Shop
//
//  Created by Евгений Прохоров on 06.07.2021.
//

import UIKit

final class MainCarouselCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    func configureCell(cellModel: MainCarouselCellModel) {
        imageView.image = cellModel.image

    }
    
}
