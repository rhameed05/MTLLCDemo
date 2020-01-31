//
//  ApiManager.swift
//  MTLLCDemo
//
//  Created by Mac on 30/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ApiManager: NSObject {
static let shareInstance = ApiManager()
    
    
   
    func getAllTopArticlesData(completion: @escaping(ArticlesViewModel?, Error?) -> ())
    {
        let session = URLSession.shared
        let url = URL(string:kArticleBaseUrl)

        let task = session.dataTask(with: url!) { data, response, error in

            if error != nil || data == nil {
                print("No Data Found")
                completion(nil,error)
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server Bad Request")
                completion(nil,error)
                return
            }

            guard let mime = response.mimeType, mime == "application/json" else {
                print("Un supported content type")
                 completion(nil,error)
                return
            }

            do {
                
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("The Response is : ",json)
                let arrMovieData = ArticlesViewModel(dictionary: json as! NSDictionary)
                completion(arrMovieData, nil)
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }

        }
        task.resume()
    }
}
