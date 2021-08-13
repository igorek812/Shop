//
//  BagViewController.swift
//  Shop
//
//  Created by Евгений Прохоров on 27.07.2021.
//

import UIKit

class BagViewController: UIViewController {
    
    var countProducts = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    @IBOutlet weak var bagTableView: UITableView!
    
    @IBOutlet weak var entityBagLabel: UILabel!
    
    @IBOutlet weak var countPickerView: UIPickerView!
    var bagTableViewManager = BagTableViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupPickerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !BacketData.shared.productInBag.isEmpty {
            bagTableView.isHidden = false
            entityBagLabel.isHidden = true
            bagTableViewManager.set(productInBag: BacketData.shared.productInBag)
            bagTableView.reloadData()
        }
        else {
            bagTableView.isHidden = true
        }
    }
}

extension BagViewController {
    
    func setupTableView() {
        bagTableView.separatorStyle = .none
        bagTableViewManager = BagTableViewManager.init()
        bagTableView.delegate = bagTableViewManager
        bagTableView.dataSource = bagTableViewManager
        countPickerView.isHidden = true
    }
}

extension BagViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func setupPickerView() {
        countPickerView.dataSource = self
        countPickerView.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countProducts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(countProducts[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}
