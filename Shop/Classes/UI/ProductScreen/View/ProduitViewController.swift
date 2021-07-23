//
//  ProduitViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 17.07.2021.
//

import UIKit

class ProduitViewController: UIViewController {
    
    var produit = ProduitModel.init(image: #imageLiteral(resourceName: "shorts"), name: "Моделирующие шорты с боковым карманом (W4/1)", price: "3800P", article: "Артикул: W4/1-08163-40-(XS)", category: "Велосипедки и шорты")
    

    @IBOutlet weak var produitImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var articleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        produitImageView.image = produit.image
        categoryLabel.text = produit.category
        nameLabel.text = produit.name
        priceLabel.text = produit.price
        articleLabel.text = produit.article
    }

}
