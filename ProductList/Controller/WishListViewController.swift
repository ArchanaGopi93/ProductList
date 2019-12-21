//
//  WishListViewController.swift
//  ProductList
//
//  Created by Techops on 21/12/19.
//  Copyright © 2019 Techops. All rights reserved.
//

import UIKit

protocol WishListDelegate :class {
     func getTotalProductsAndAmount(items: Int, totalSavings: Int, totalAmount: Int) 
}


class WishListViewController: UIViewController {
   
    

    @IBOutlet weak var itemsCount: UILabel!
    
    @IBOutlet weak var totalSavings: UILabel!
    
    @IBOutlet weak var totalPrice: UILabel!
    
    weak var wishListDelegate : WishListDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getTotalProductsAndAmount()

        // Do any additional setup after loading the view.
    }
   
       
       func getTotalProductsAndAmount() {
        self.itemsCount.text = String(numberOfProductsInWishList)
        self.totalSavings.text = String(totalSavingsAmount)
        self.totalPrice.text = String(totalAmount)
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
