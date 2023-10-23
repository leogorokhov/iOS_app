//
//  ViewController.swift
//  iOS_app
//
//  Created by Леонид Горохов on 09.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        
        let url: URL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php")!
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard
                let data,
                let response,
                error == nil
            else {
                    return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let model = try! decoder.decode(Root.self, from: data)
            print(model)
        }).resume()
        
    }


}

struct Root : Decodable {
    let drinks : [DrinkDTO]
}

struct DrinkDTO: Decodable {
    let idDrink: String
    let strDrink: String
    let strInstructions: String
    let strDrinkThumb: URL
}
