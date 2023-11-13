//
//  FoodTableView.swift
//  iOS_app
//
//  Created by Леонид Горохов on 13.11.2023.
//

import UIKit

final class FoodTableView: UIView {
    private lazy var tableManager = FoodTableManager()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.dataSource = tableManager
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        addSubViews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: Root) {
        tableManager.foodData = viewModel
        tableView.reloadData()
    }
    
}

private extension FoodTableView {
    func addSubViews() {
        [tableView].forEach {
            self.addSubview($0)
        }
    }
    func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
