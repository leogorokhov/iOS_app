//
//  FoodTableManager.swift
//  iOS_app
//
//  Created by Леонид Горохов on 13.11.2023.
//

import Foundation
import UIKit

final class FoodTableManager: NSObject{
    var foodData: Root?
}

// MARK: - UITableViewDataSource

extension FoodTableManager: UITableViewDataSource{
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
    
}
