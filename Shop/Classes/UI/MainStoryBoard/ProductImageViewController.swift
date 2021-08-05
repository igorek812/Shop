//
//  ProductImageViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 28.07.2021.
//

import UIKit

class ProductImageViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var imageScrollView: UIScrollView!
    
    var image: ProductImageModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageScrollView.delegate = self
        productImageView.image = image?.image
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension ProductImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return productImageView
    }
}
