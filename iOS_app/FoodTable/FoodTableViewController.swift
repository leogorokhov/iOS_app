//
//  FoodTableViewController.swift
//  iOS_app
//
//  Created by Леонид Горохов on 13.11.2023.
//

import Foundation
import UIKit

final class FoodTableViewController: UIViewController{
    
    private lazy var contentView: FoodTableView = {
        let view = FoodTableView()
        return view
    }()
    
    private let service: FoodServicing
    
    init(service: FoodServicing) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchFood { foods in
            DispatchQueue.main.async {
                self.contentView.configure(with: foods)
            }
        }
    }
}
