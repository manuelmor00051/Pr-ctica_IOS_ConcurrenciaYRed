//
//  CategoryDetailViewController.swift
//  DiscourseClient
//
//  Created by Manuel Moreno Cámara on 4/1/22.
//

import UIKit

class CategoryDetailViewController: UIViewController {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    let viewModel: CategoryDetailViewModel
    
    init(viewModel: CategoryDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "CategoryDetailViewController", bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.categoryFetch()
        DispatchQueue.main.async {
            self.showLoading()
            
        }
    }
    
}

extension CategoryDetailViewController: CategoryDetailDelegate {
    func detailFetched() {
        hideLoading()
        self.idLabel?.text = "\(self.idLabel.text ?? "") \(String(self.viewModel.id))"
        self.nameLabel?.text = "\(self.nameLabel.text ?? "") \(self.viewModel.detail?.name ?? "")"
    }
    
    func detailError() {
        hideLoading()
        showAlert(title: "Error fetching detail")
    }
    
    
}

