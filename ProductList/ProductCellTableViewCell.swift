//
//  ProductCellTableViewCell.swift
//  ProductList
//
//  Created by Techops on 20/12/19.
//  Copyright © 2019 Techops. All rights reserved.
//

import UIKit

protocol ProductPreferenceDelegate : class {
    func addOrRemoveProductsFromList(cell:ProductCellTableViewCell)
}

class ProductCellTableViewCell: UITableViewCell {

    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    var hasOffer:Bool = false
    @IBOutlet weak var stepper: UIStepper!
    
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
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        if !self.isPreferred {
            self.isPreferred = true
        } else {
            self.isPreferred = false
        }
        self.preferredDelegate?.addOrRemoveProductsFromList(cell:self)
    }
    
}
