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
    case new = "new"
    case sport = "sport"
    case swimsuit = "swimsuit"
    case tracksuits = "tracksuits"
    case pants = "pants"
    case tops = "tops"
    case fitnessRubberBands = "fitnessRubberBands"
    case sales = "sales"
}

struct CatalogViewModel {
    let category: AssortmentCategory
    let item: CatalogModel
}
