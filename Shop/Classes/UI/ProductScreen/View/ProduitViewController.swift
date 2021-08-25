//
//  ProduitViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 17.07.2021.
//

import UIKit

class ProduitViewController: UIViewController {
    
    var animator: Animator?
    
    var updateCell: (() -> Void)?
    
    var productCollectionViewManager: ProductCollectionViewManager?
    var sizeCollectionViewManager: SizeCollectionViewManager?
    var colorCollectionViewManager: ColorCollectionViewManager?
    var product: ProductModel?
    var selectedSize: String?
    var selectedColor: String?
    
    @IBOutlet weak var chooseSizeLabel: UILabel!
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    
    
    @IBOutlet weak var carouselPageControl: UIPageControl!
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var bagButton: UIButton!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var heightSizeCollectionViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseSizeLabel.isHidden = true
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkFavouriteButton()
    }
    
    override func viewWillLayoutSubviews() {
        heightSizeCollectionViewConstraint.constant = sizeCollectionView.contentSize.height
    }
    
    @IBAction func bagButtonTapped(_ sender: Any) {
        
        if selectedSize == nil {
            chooseSizeLabel.isHidden = false
            let alertVC = UIAlertController(title: "Размер не выбран", message: "Пожалуйста, выберите размер", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ок", style: .default, handler: nil)
            alertVC.addAction(alertAction)
            self.present(alertVC, animated: true, completion: nil)
        }
        else {
            bagButton.setTitle("Товар добавлен в корзину", for: .normal)
            bagButton.backgroundColor = .systemGray
            chooseSizeLabel.isHidden = true
            selectedColor = colorNameLabel.text ?? ""
            guard let product = product else { return }
            BacketData.shared.addProductToBag(product: product, size: selectedSize ?? "", color: selectedColor ?? "")
            tabBarController?.tabBar.updateBagBadge(badge: "\(BacketData.shared.countProductInBag)")
        }
    }
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        
        guard let product = product else { return }
        
        let starFill = UIImage(systemName: "star.fill")
        let star = UIImage(systemName: "star")
        if favouriteButton.imageView?.image == starFill {
            favouriteButton.setImage(star, for: .normal)
            BacketData.shared.removeProductInFavourite(product: product)
        }
        else {
            favouriteButton.setImage(starFill, for: .normal)
            BacketData.shared.addProductInFavourite(product: product)
            updateCell?()
        }
    }

}

private extension ProduitViewController {
    
    private func checkFavouriteButton() {
        
        let starFill = UIImage(systemName: "star.fill")
        let star = UIImage(systemName: "star")
        
        if BacketData.shared.favouriteProducts.contains(where: { item in
            item.id == product?.id
        }) {
            favouriteButton.setImage(starFill, for: .normal)
        } else {
            favouriteButton.setImage(star, for: .normal)
        }
    }
    
    func updateImage(color: ColorModel) {
        
        guard let product = product else { return }
        
        self.colorNameLabel.text = color.name
        self.productCollectionViewManager?.imageProduct.removeAll()
        self.productCollectionViewManager?.set(imageProduct: product.image, colorName: color.name)
        self.productCollectionView.reloadData()
    }
    
    private func setup() {
        
        guard let product = product else { return }
        colorNameLabel.text = product.color[0].name
            
        productCollectionViewManager = ProductCollectionViewManager.init()
        productCollectionView.delegate = productCollectionViewManager
        productCollectionView.dataSource = productCollectionViewManager
        productCollectionViewManager?.set(imageProduct: product.image, colorName: colorNameLabel.text ?? "nil")
        productCollectionViewManager?.updatePage = { [weak self] page in
            self?.carouselPageControl.currentPage = page
        }
        productCollectionView.reloadData()
        
        sizeCollectionViewManager = SizeCollectionViewManager.init()
        sizeCollectionView.delegate = sizeCollectionViewManager
        sizeCollectionView.dataSource = sizeCollectionViewManager
        sizeCollectionViewManager?.set(product: product)
        sizeCollectionViewManager?.didSelect = { selectedSize in
            self.selectedSize = selectedSize
        }
        sizeCollectionView.reloadData()
        
        colorCollectionViewManager = ColorCollectionViewManager.init()
        colorCollectionView.delegate = colorCollectionViewManager
        colorCollectionView.dataSource = colorCollectionViewManager
        colorCollectionViewManager?.set(product: product)
        colorCollectionViewManager?.didSelect = { color in
            self.updateImage(color: color)
        }
        colorCollectionView.reloadData()
        
        categoryLabel.text = product.category[0].rawValue
        nameLabel.text = product.name
        priceLabel.text = "\(product.price) руб."
        articleLabel.text = product.article[0].article
        
        productCollectionViewManager?.didSelect = { image in
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            guard let productImageVC = storyboard.instantiateViewController(identifier: "ProductImageView") as? ProductImageViewController else { return }
            
            productImageVC.image = image
    
            productImageVC.modalPresentationStyle = .fullScreen
            productImageVC.transitioningDelegate = self
            
            self.present(productImageVC, animated: true)
        }
    }
}

extension ProduitViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
        guard let secondViewController = presented as? ProductImageViewController,
            let selectedCellImageViewSnapshot = productCollectionViewManager?.selectedCellImageViewSnapshot
            else { return nil }

        animator = Animator(type: .present, firstViewController: self, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        guard let secondViewController = dismissed as? ProductImageViewController,
              let selectedCellImageViewSnapshot = productCollectionViewManager?.selectedCellImageViewSnapshot
            else { return nil }

        animator = Animator(type: .dismiss, firstViewController: self, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
}
