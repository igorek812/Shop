//
//  CatalogModel.swift
//  Shop
//
//  Created by Евгений Прохоров on 10.07.2021.
//

import UIKit

struct CatalogModel {
    let image: UIImage
    let title: String
}

enum AssortmentCategory: String {
    case new = "Новинки"
    case sport = "Одежда для спорта"
    case swimsuit = "Купальники и белье"
    case tracksuits = "Спортивные костюмы"
    case pants = "Брюки, джеггинсы, юбки"
    case tops = "Топы, корсеты"
    case fitnessRubberBands = "Фитнес резинки"
    case sales = "Скидки"
    
}

enum Category: String {
    case sport = "Одежда для спорта"
    case swimsuit = "Купальники и белье"
    case tracksuits = "Спортивные костюмы"
    case pants = "Брюки, джеггинсы, юбки"
    case tops = "Топы, корсеты"
    case fitnessRubberBands = "Фитнес резинки"
}

struct CatalogViewModel {
    let category: AssortmentCategory
    let item: CatalogModel
    var product: ProductModel?
}
