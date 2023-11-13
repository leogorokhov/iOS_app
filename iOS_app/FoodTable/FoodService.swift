//
//  FoodService.swift
//  iOS_app
//
//  Created by Леонид Горохов on 13.11.2023.
//

import Foundation

protocol FoodServicing: AnyObject {
    func fetchFood(completionHandler: @escaping (Root) -> Void)
}

final class FoodService {
    
    let decoder = JSONDecoder()
    let session : URLSession = {
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        return session
    }()
}

// MARK: - FoodServicing

extension FoodService: FoodServicing {
    func fetchFood(completionHandler: @escaping (Root) -> Void) {
        let headers = [
            "X-RapidAPI-Key": "1645d81122msha1fdaae7ea346dfp175a2ajsnec8c6bc90f73",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=under_30_minutes")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard
                let data,
                error == nil
            else {
                return
            }
            
            let decoder = JSONDecoder()
            let foodData = try! decoder.decode(Root.self, from: data)
            completionHandler(foodData)
        }).resume()
    }
}

