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

struct AssortmentSectionModel {
    let category: AssortmentCategory
    let items: [CatalogModel]
}

enum AssortmentCategory {
    case new
    case sport
    case swimsuit
    case tracksuits
    case pants
    case tops
    case fitnessRubberBands
    case sales
}
