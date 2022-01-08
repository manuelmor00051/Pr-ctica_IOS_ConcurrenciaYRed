//
//  CategoriesViewController.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    lazy var table: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    let viewModel: CategoriesViewModel
    
    init(viewModel: CategoriesViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchCategories()
        DispatchQueue.main.async {
            self.showLoading()
        }
        
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .gray
        view.addSubview(table)
        
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.categories.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(self.viewModel.categories.categories[indexPath.row].id): \(self.viewModel.categories.categories[indexPath.row].name)"
        let color = UIColor(hexString: "#" + self.viewModel.categories.categories[indexPath.row].color)
        cell.backgroundColor = color
        return cell
    }
}

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didSelectRow(index: indexPath.row)
    }
}

extension CategoriesViewController: CategoriesDelegate {
    func categoriesFetched() {
        hideLoading()
        table.reloadData()
    }
    
    func categoriesError() {
        hideLoading()
        showAlert(title: "error fetching Categories")
    }
}
