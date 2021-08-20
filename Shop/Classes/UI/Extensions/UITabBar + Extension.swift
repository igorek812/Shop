//
//  UITabBar + Extension.swift
//  Shop
//
//  Created by Евгений Прохоров on 15.08.2021.
//

import UIKit

extension UITabBar {
    func updateBagBadge(badge: String) {
        items?[2].badgeValue = badge
    }
}
