//
//  ViewController.swift
//  iOS_app
//
//  Created by Леонид Горохов on 09.10.2023.
//

import UIKit
import SnapKit
import Foundation

final class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        foodData?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let food = foodData?.results else { return UITableViewCell() }
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        // configuration.image = UIImage()
        configuration.text = food[indexPath.row].name
        configuration.secondaryText = food[indexPath.row].description
        cell.contentConfiguration = configuration
        return cell
    }
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.dataSource = self
        return tableView
    }()
    
    private var foodData: Root?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
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
            self.foodData = try! decoder.decode(Root.self, from: data)
            
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
            })
        })
        
        dataTask.resume()
        
    }
}

struct Root : Decodable {
    let results : [FoodDTO]
}

struct FoodDTO: Decodable {
    let id: Int
    let name: String
    let description: String
    let thumbnail_url: URL
}
