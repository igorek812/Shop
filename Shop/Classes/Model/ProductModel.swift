//
//  AssortmentModel.swift
//  Shop
//
//  Created by Евгений Прохоров on 11.07.2021.
//

import UIKit

struct ProductModel {
    let id: Int
    let image: [ProductImageModel]
    let name: String
    let price: String
    var article: [ArticleModel]
    var color: [ColorModel]
    var size: [SizeModel]
    let category: AssortmentCategory
}

struct ProductImageModel {
    let image: UIImage
    let color: String
}

struct ColorModel {
    let color: UIColor
    let name: String
}

struct ArticleModel {
    let article: String
}

struct SizeModel {
    let size: String
}

struct BagModel {
    let product: ProductModel
    var selectedSize: String
    var selectedColor: String
    var count: Int
}
