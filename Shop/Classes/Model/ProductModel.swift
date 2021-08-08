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
    var article: [ArticleModel]
    let color: [ColorModel]
    let size: [SizeModel]
    let category: AssortmentCategory
}

struct ProductImageModel {
    let image: UIImage
}

struct ColorModel {
    let color: UIColor
}

struct ArticleModel {
    let article: String
}

struct SizeModel {
    let size: String
}
