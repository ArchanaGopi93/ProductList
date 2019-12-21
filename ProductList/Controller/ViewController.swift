//
//  ViewController.swift
//  ProductList
//
//  Created by Techops on 20/12/19.
//  Copyright © 2019 Techops. All rights reserved.
//

import UIKit




var numberOfProductsInWishList = 0
var totalSavingsAmount = 0
var totalAmount = 0


class ProductListViewController: UITableViewController,ProductPreferenceDelegate {
    var productArray = [Product]()
    var preferredProducts = [Product]()
    var count = 1
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.parseProductItems()
        let worker = ServiceWorker()
        worker.performServiceCallToFetchData { (products, error) in
            if error == nil , let _products = products, _products.count > 0 {
                for product in _products  {
                    self.productArray.append(product)
                }
                
                DispatchQueue.main.async {
                    self.tableView.register(UINib(nibName: "ProductCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
                               self.tableView.delegate = self
                               self.tableView.dataSource = self
                               self.tableView.reloadData()
                    }
                }
                
        }
       

        // Do any additional setup after loading the view.
    }
    
    
    func parseProductItems() {
     

            if let path = Bundle.main.path(forResource: "ProductList", ofType: "json") {

                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONDecoder().decode([Product].self, from: data)
                    for product in jsonResult {
                        let _product = Product(productName: product.name ?? "" , productPrice: product.price ?? "" , image: product.image ?? "" ,pid: product.pid ?? "" ,description: product.desc ?? "" ,offerPrice:product.offerPrice ?? "")
                        productArray.append(_product)
                    }

                

                } catch {
                   print(error)
                }
            }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductCellTableViewCell
        cell?.preferredDelegate = self
        let product = productArray[indexPath.row] as Product
        cell?.product = product
        cell?.productName.text = product.name
        cell?.productPrice.text = product.price
        let hasOffer = self.checkForOfferPrice(product: product)
        if hasOffer {
            cell?.productPrice.textColor = UIColor.red
        } else {
            cell?.productPrice.textColor = UIColor.black
        }
        cell?.productImage.image = UIImage(named: "product-image")
        
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return productArray.count
      }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func checkForOfferPrice(product : Product)  -> Bool {
       
        if product.price != nil {
                
                return true
            } else {
                return false
        }
        
        
    }
 
    
    func addOrRemoveProductsFromList(id: String?, isAdded: Bool) {
        if let pid = id {
            if let product = productArray.filter({$0.pid == pid}).first {
            if isAdded {
                productArray.append(product)
            } else {
                if let index = productArray.firstIndex(where: {$0.pid == pid}) {
                productArray.remove(at: index)
                }
            }
                preferredProducts = productArray
                tableView.reloadData()
                self.createWishList()
            }
        }
    }
    
    func countTheTotalNumberOfProductsInWishList() {
        numberOfProductsInWishList = preferredProducts.count
        
    }
    
    func getTotalOfferAndProductAmount() {
        let _preferredProducts = preferredProducts.filter({$0.offerPrice != nil})
        for product in _preferredProducts {
            if let offerPrice = product.offerPrice {
                totalSavingsAmount += Int(offerPrice) ?? 0
        }
            if let price = product.price {
                totalAmount += Int(price) ?? 0
            }
        }

    }
    
    func createWishList() {
        self.countTheTotalNumberOfProductsInWishList()
        self.getTotalOfferAndProductAmount()
        
    }
    
    
    
}


