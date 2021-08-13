//
//  AssortimentService.swift
//  Shop
//
//  Created by Igor on 22.07.2021.
//

import UIKit

final class AssortimentService {
    
    let items: [ProductModel] = [
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "blackshoes-1"), color: "Black"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blackshoes-2"), color: "Black"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blackshoes-3"), color: "Black"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blackshoes"), color: "Black")],
                          name: "Легинсы с молниями и фигурными линиями (L24)",
                          price: "5700 руб.",
                          article: [ArticleModel.init(article: "Артикул: L24-9005-40/164-(XS/164)")],
                          color: [ColorModel.init(color: .black, name: "Black", isDefault: true)],
                          size:
                            [SizeModel.init(size: "40/164(XS/164)"),
                             SizeModel.init(size: "40/170(XS/170)"),
                             SizeModel.init(size: "40/176(XS/176)"),
                             SizeModel.init(size: "40/182(XS/182)"),
                             SizeModel.init(size: "42/164(S/164)"),
                             SizeModel.init(size: "42/170(S/170)"),
                             SizeModel.init(size: "42/176(S/176)"),
                             SizeModel.init(size: "42/182(S/182)"),
                             SizeModel.init(size: "44/164(M/164)"),
                             SizeModel.init(size: "44/170(M/170)"),
                             SizeModel.init(size: "44/176(M/176)"),
                             SizeModel.init(size: "44/182(M/182)"),
                             SizeModel.init(size: "46/164(L/164)"),
                             SizeModel.init(size: "46/170(L/170)"),
                             SizeModel.init(size: "46/176(L/176)"),
                             SizeModel.init(size: "46/182(L/182)")],
                          category: .pants),
        
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "avocado1"), color: "Avocado"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "avocado2"), color: "Avocado"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "avocado3"), color: "Avocado"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "avocado4"), color: "Avocado"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "cannoliCream1"), color: "Cannoli cream"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "cannoliCream2"), color: "Cannoli cream"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "cannoliCream3"), color: "Cannoli cream"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "cannoliCream4"), color: "Cannoli cream")],
                          name: "Раздельный купальник с разрезом под грудью (Q13)",
                          price: "4500 руб.",
                          article: [ArticleModel.init(article: "Артикул: Q13-08324-40-(XS)")],
                          color: [ColorModel.init(color: UIColor(red: 237/255, green: 245/255, blue: 206/255, alpha: 1), name: "Avocado", isDefault: true), ColorModel.init(color: UIColor(red: 251/255, green: 251/255, blue: 251/255, alpha: 1), name: "Cannoli cream", isDefault: false)],
                          size: [SizeModel.init(size: "40(XS)"),
                                 SizeModel.init(size: "42(S)"),
                                 SizeModel.init(size: "44(M)"),
                                 SizeModel.init(size: "46(L)")],
                          category: .swimsuit),

        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "blackshorts-1"), color: "Black"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blackshorts-2"), color: "Black"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blackshorts-3"), color: "Black"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blackshorts"), color: "Black")],
                          name: "Шорты с фигурным вырезом и анатомическим кроем (W5)",
                          price: "4300 руб.",
                          article: [ArticleModel.init(article: "Артикул: W5-9005-40-(XS)")],
                          color: [ColorModel.init(color: .black, name: "Black", isDefault: true)],
                          size: [SizeModel.init(size: "40(XS)"),
                                 SizeModel.init(size: "42(S)"),
                                 SizeModel.init(size: "44(M)"),
                                 SizeModel.init(size: "46(L)")],
                          category: .sport),
        
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "butternut1"), color: "Soft"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "butternut2"), color: "Soft"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "butternut3"), color: "Soft"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "butternut4"), color: "Soft")],
                          name: "Бесшовный спортивный бюстгальтер (Y4)",
                          price: "2700 руб.",
                          article: [ArticleModel.init(article: "Артикул: Y4-11-0602tpx-40/-(XS)")],
                          color: [ColorModel.init(color: UIColor(red: 239/255, green: 234/255, blue: 228/255, alpha: 1), name: "Soft", isDefault: true)],
                          size: [SizeModel.init(size: "40(XS)"),
                                 SizeModel.init(size: "42(S)"),
                                 SizeModel.init(size: "44(M)")],
                          category: .sales),
        
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "blackbomber-1"), color: "Black"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blackbomber-2"), color: "Black"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blackbomber-3"), color: "Black"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blackbomber"), color: "Black")],
                        name: "Бомбер с контрастными строчками (M4)",
                        price: "14900 руб.",
                        article: [ArticleModel.init(article: "Артикул: M4-9005-40/42-(XS/S)")],
                        color: [ColorModel.init(color: .black, name: "Black", isDefault: true)],
                        size:
                                [SizeModel.init(size: "40/42(XS/S)"),
                                 SizeModel.init(size: "44/46(M/L)")],
                        category: .tracksuits),
        
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "blacktop"), color: "Black"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blacktop-2"), color: "Black"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blacktop-3"), color: "Black"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blacktop"), color: "Black")],
                        name: "Топ на молнии c рельефными линиями и длинным рукавом (N14)",
                        price: "4300 руб.",
                        article: [ArticleModel.init(article: "Артикул: N14-9005-40-(XS)")],
                        color: [ColorModel.init(color: .black, name: "Топ на молнии c рельефными линиями и длинным рукавом (N14)", isDefault: true)],
                        size: [SizeModel.init(size: "40(XS)"),
                               SizeModel.init(size: "42(S)"),
                               SizeModel.init(size: "44(M)"),
                               SizeModel.init(size: "46(L)")],
                        category: .tops),
        
        ProductModel.init(image: [ProductImageModel.init(image: #imageLiteral(resourceName: "blue-1"), color: "Blue"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blue-2"), color: "Blue"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blue-3"), color: "Blue"),
                                  ProductImageModel.init(image: #imageLiteral(resourceName: "blue"), color: "Blue")],
                        name: "Набор фитнес резинок Iron by Mironova (тканевые)",
                        price: "2400 руб.",
                        article: [ArticleModel.init(article: "Артикул: RBO14-30")],
                        color: [ColorModel.init(color: .blue, name: "Blue", isDefault: true)],
                        size: [SizeModel.init(size: "8x33/8x38/8x43")],
                        category: .fitnessRubberBands)
    ]
    
    func getItemsBy(category: AssortmentCategory) -> [ProductModel] {
        return items.filter { $0.category == category }
    }
}
