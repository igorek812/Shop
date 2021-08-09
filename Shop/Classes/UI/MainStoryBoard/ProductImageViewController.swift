//
//  ProductImageViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 28.07.2021.
//

import UIKit

class ProductImageViewController: UIViewController {

    @IBOutlet private(set) var productImageView: UIImageView!
    @IBOutlet private(set) var imageScrollView: UIScrollView!
    @IBOutlet private(set) var escapeButton: UIButton!
    
    var image: ProductImageModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cross = #imageLiteral(resourceName: "cross").withRenderingMode(.alwaysTemplate)
        escapeButton.setImage(cross, for: .normal)
        escapeButton.tintColor = .white
        imageScrollView.delegate = self
        productImageView.image = image?.image
        
    }
    
    @IBAction func escapeTapped(_ sender: Any) {
        dismiss(animated: true)
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
