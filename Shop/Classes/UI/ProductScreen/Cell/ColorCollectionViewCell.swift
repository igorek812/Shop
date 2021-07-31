//
//  ColorCollectionViewCell.swift
//  Shop
//
//  Created by Евгений Прохоров on 28.07.2021.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    func configureCell(cellModel: ColorModel) {
        
        backgroundColor = cellModel.color
        
        layer.cornerRadius = frame.height / 2
    }
}
