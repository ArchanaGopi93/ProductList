//
//  ProductCellTableViewCell.swift
//  ProductList
//
//  Created by Techops on 20/12/19.
//  Copyright © 2019 Techops. All rights reserved.
//

import UIKit

protocol ProductPreferenceDelegate : class {
    func addOrRemoveProductsFromList(id:String?,isAdded:Bool)
}

class ProductCellTableViewCell: UITableViewCell {

    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var product : Product? = nil
    var hasOffer:Bool = false
    var countValue:Int = 1

    
    @IBOutlet weak var count: UILabel!
    var isPreferred :Bool = false
    weak var preferredDelegate:ProductPreferenceDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
    
    @IBAction func addButtonTapped(_ sender: Any) {
        self.countValue += 1
        self.count.text = countValue.description
        self.preferredDelegate?.addOrRemoveProductsFromList(id: product?.pid, isAdded: true)
    }
    
    
    @IBAction func removeButtonTapped(_ sender: Any) {
        self.countValue -= 1
        self.count.text = countValue.description
          self.preferredDelegate?.addOrRemoveProductsFromList(id: product?.pid, isAdded: false)
    }
    
}
