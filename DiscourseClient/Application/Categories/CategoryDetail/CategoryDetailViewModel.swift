//
//  CategoryDetailViewModel.swift
//  DiscourseClient
//
//  Created by Manuel Moreno Cámara on 2/1/22.
//

import Foundation

protocol CategoryDetailDelegate: AnyObject {
    func detailFetched()
    func detailError()
}

class CategoryDetailViewModel: ViewModel {
    var detail: Category?
    weak var delegate: CategoryDetailDelegate?
    let coordinator: CategoryDetailCoordinator
    let id: Int
    
    init(id: Int, coordinator: CategoryDetailCoordinator) {
        self.coordinator = coordinator
        self.id = id
    }
    
    func categoryFetch() {
        let request = CategoryDetailRequest(id: self.id)
        session.request(request: request) { [ weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let response):
                    guard let detail = response?.category else { return }
                    self.detail = detail
                    self.delegate?.detailFetched()
                    
                case .failure(let error):
                    print(error)
                    self.delegate?.detailError()
            }
        }
        
    }
}
