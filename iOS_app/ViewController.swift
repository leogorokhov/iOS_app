//
//  ViewController.swift
//  iOS_app
//
//  Created by Леонид Горохов on 09.10.2023.
//

import UIKit
import SnapKit
import Foundation

final class ViewController: UIViewController{

    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
            
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
            })

    }
}



