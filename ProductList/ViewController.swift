//
//  ViewController.swift
//  ProductList
//
//  Created by Techops on 20/12/19.
//  Copyright © 2019 Techops. All rights reserved.
//

import UIKit

class ViewController: UITableViewController{
    
    var productArray = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.parseProductItems()
        let worker = ServiceWorker()
        worker.performServiceCallToFetchData()
        tableView.register(UINib(nibName: "ProductCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    
    func parseProductItems() {
     

            if let path = Bundle.main.path(forResource: "ProductList", ofType: "json") {

                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONDecoder().decode([Product].self, from: data)
                    for product in jsonResult {
                        let _product = Product(productName: product.productName, productPrice: product.productPrice, image: product.image,pid: product.pid,description: product.description)
                        productArray.append(_product)
                    }

                

                } catch {
                   print(error)
                }
            }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductCellTableViewCell
        let product = productArray[indexPath.row] as Product
        cell?.productName.text = product.productName
        cell?.productPrice.text = product.productPrice
        cell?.productImage.image = UIImage(named: "product-image")
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return productArray.count
      }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}

