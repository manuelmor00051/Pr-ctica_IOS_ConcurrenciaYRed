//
//  CategoryDetailCoordinator.swift
//  DiscourseClient
//
//  Created by Manuel Moreno Cámara on 2/1/22.
//

import Foundation
import UIKit

class CategoryDetailCoordinator: Coordinator {
    var navigator: UINavigationController
    let id: Int
    
    init(navigator: UINavigationController, id: Int) {
        self.navigator = navigator
        self.id = id
        
    }
    
    func start() {
        let categoryDetailViewModel = CategoryDetailViewModel(id: self.id, coordinator: self)
        let categoryDetailViewController = CategoryDetailViewController(viewModel: categoryDetailViewModel)
        categoryDetailViewController.title = "Category Detail"
        
        navigator.pushViewController(categoryDetailViewController, animated: false)
    }
    
    
}
