//
//  ProductModel.swift
//  ProductList
//
//  Created by Techops on 20/12/19.
//  Copyright © 2019 Techops. All rights reserved.
//

import Foundation

struct Product:Codable {
    let productName :String
    let productPrice:String
    let image : String
    let pid:String
    let description:String
    let offerPrice:String

    
    init(productName:String,productPrice:String,image:String,pid:String,description:String,price:String,offerPrice:String) {
        self.productName = productName
        self.productPrice = productPrice
        self.image = image
        self.pid = pid
        self.description = description
        self.productPrice = price
        self.offerPrice = offerPrice
        
    }
    enum CodingKeys: String, CodingKey {
          case productName = "name"
          case productPrice = "price"
          case image = "image"
          case pid = "pid"
          case description = "desc"
          case offerPrice = "offerPrice"
      }
}
