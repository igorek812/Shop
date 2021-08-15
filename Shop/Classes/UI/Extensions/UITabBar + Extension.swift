//
//  UITabBar + Extension.swift
//  Shop
//
//  Created by Евгений Прохоров on 15.08.2021.
//

import UIKit

extension BagViewController: UITabBarDelegate {
    func updateBagBadge(badge: String) {
        tabBarController?.tabBar.items?[2].badgeValue = badge
    }
}
