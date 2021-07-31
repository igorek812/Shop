//
//  ProductImageViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 28.07.2021.
//

import UIKit

class ProductImageViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    
    var image: ProductImageModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillLayoutSubviews() {
        productImageView.image = image?.image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
