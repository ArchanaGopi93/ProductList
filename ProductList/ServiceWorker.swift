//
//  ServiceWorker.swift
//  ProductList
//
//  Created by Techops on 20/12/19.
//  Copyright © 2019 Techops. All rights reserved.
//

import Foundation

class ServiceWorker  {
    
    func performServiceCallToFetchData()  {
           
        
        let session = URLSession.shared
       
        let url = URL(string: "http://www.mocky.io/v2/5dfb59e72f00006200ff9e80")
          guard let downloadURL = url else { return }
          //POST Req


          var request = URLRequest(url: downloadURL)
          request.httpMethod = "POST"
          request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = session.dataTask(with: downloadURL) { data, response, error in

            if error != nil || data == nil {
                print("Client error!")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }

            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }

          
//              if let jsonData = response?.data(using: .utf8)
//                {
//                    let decoder = JSONDecoder()
//
//                    do {
//                        let user = try decoder.decode(Product.self, from: jsonData)
//                        print(user.last_name)
//                    } catch {
//                        print(error.localizedDescription)
//                    }
//                }
                
                
            
        }

        task.resume()
    }
    
    
}
