//
//  ServiceWorker.swift
//  ProductList
//
//  Created by Techops on 20/12/19.
//  Copyright © 2019 Techops. All rights reserved.
//

import Foundation

class ServiceWorker  {
    
    func performServiceCallToFetchData(completion: @escaping(_ model:[Product]?,_ error:Error?) -> Void)  {
           
        
        let session = URLSession.shared
       
        let url = URL(string: "http://www.mocky.io/v2/5dfb59e72f00006200ff9e80")
          guard let downloadURL = url else { return }
          //POST Req


          var request = URLRequest(url: downloadURL)
          request.httpMethod = "POST"
          request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = session.dataTask(with: downloadURL) { (data, response, error) in
            if let _data = data {
                if let products =  try? JSONDecoder().decode([Product].self, from: _data) {
                    completion(products,nil)
                } else {
                    completion(nil,error)
                }
                              
            }
        }
        task.resume()
     
    }
    
}

