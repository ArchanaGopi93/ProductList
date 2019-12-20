//
//  ProductModel.swift
//  ProductList
//
//  Created by Techops on 20/12/19.
//  Copyright © 2019 Techops. All rights reserved.
//

import Foundation

class Product:Codable {
    let name :String?
    let price:String?
    let image : String?
    let pid:String?
    let desc:String?
    let offerPrice:String?
    
    
    init(productName:String,productPrice:String,image:String,pid:String,description:String,offerPrice:String) {
        self.name = productName
        self.price = productPrice
        self.image = image
        self.pid = pid
        self.desc = description
        self.offerPrice = offerPrice
        
    }

}
