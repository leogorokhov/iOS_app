//
//  FoodTableViewControllerFactory.swift
//  iOS_app
//
//  Created by Леонид Горохов on 13.11.2023.
//

import Foundation

final class FoodTableViewControllerFactory {
    func build() -> FoodTableViewController {
        let service = FoodService()
        let viewController = FoodTableViewController(service: service)
        return viewController
    }
}
