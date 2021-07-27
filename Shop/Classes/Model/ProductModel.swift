//
//  AssortmentModel.swift
//  Shop
//
//  Created by Евгений Прохоров on 11.07.2021.
//

import UIKit

struct ProductModel {
    let image: [ProductImageModel]
    let name: String
    let price: String
    var article: String
    let category: AssortmentCategory
}

struct ProductImageModel {
    let image: UIImage
}
