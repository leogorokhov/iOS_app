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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.backgroundColor = .white
       
        
            
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
            })

    }
}



