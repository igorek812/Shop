//
//  SizeCollectionViewCell.swift
//  Shop
//
//  Created by Евгений Прохоров on 28.07.2021.
//

import UIKit

class SizeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    func configureCell(cellModel: SizeModel) {
        sizeLabel.text = cellModel.size
        backgroundColor = .white
        sizeLabel.textColor = .lightGray
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
}
