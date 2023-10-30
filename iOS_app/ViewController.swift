//
//  ViewController.swift
//  iOS_app
//
//  Created by Леонид Горохов on 09.10.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let drink = drinkData?.drinks else { return UITableViewCell() }
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        // configuration.image = UIImage()
        configuration.text = drink[indexPath.row].strDrink
        configuration.secondaryText = drink[indexPath.row].idDrink
        cell.contentConfiguration = configuration
        return cell
    }
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.dataSource = self
        return tableView
    }()
    
    private var drinkData: Root?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        view.addSubview(tableView)
        tableView.backgroundColor = .systemGray
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        let url: URL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php")!
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard
                let data,
                error == nil
            else {
                    return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            self.drinkData = try! decoder.decode(Root.self, from: data)

            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
            })
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
