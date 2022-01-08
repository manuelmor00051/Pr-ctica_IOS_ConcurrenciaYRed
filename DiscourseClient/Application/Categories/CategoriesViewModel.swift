//
//  CategoriesViewModel.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import Foundation

protocol CategoriesDelegate: AnyObject {
    func categoriesFetched()
    func categoriesError()
}

final class CategoriesViewModel: ViewModel {
    let coordinator: CategoriesCoordinator
    var categories = CategoryList(categories: [])
    weak var delegate: CategoriesDelegate?
    
    init(coordinator: CategoriesCoordinator) {
        self.coordinator = coordinator
    }
    
    func fetchCategories() {
        let request = LatestCategoriesRequest()
        session.request(request: request) { [ weak self ] result in
            guard let self = self else { return }
            switch result {
                case .success(let response):
                    guard let categories = response?.categoryList else { return }
                    self.categories = categories
                    self.delegate?.categoriesFetched()
                
                case .failure(let error):
                    self.delegate?.categoriesError()
                    print(error)
                    
            }
        }
    }
    
    func didSelectRow(index: Int) {
        coordinator.didSelect(categoryId: self.categories.categories[index].id)
    }
}
