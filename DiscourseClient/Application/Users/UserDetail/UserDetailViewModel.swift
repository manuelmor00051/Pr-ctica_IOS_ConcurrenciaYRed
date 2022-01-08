//
//  UserDetailViewModel.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import Foundation

protocol UserDetailDelegate: AnyObject {
    func userDetailFetched(id: Int, username: String)
    func userDetailError()
}


final class UserDetailViewModel: ViewModel {
    
    let coordinator: UserDetailCoordinator
    var username: String
    weak var delegate: UserDetailDelegate?
    
    init(username: String, coordinator: UserDetailCoordinator) {
        self.coordinator = coordinator
        self.username = username
    }
    
    func fetchTopicDetail() {
        let request = UserDetailRequest(username: self.username)
        session.request(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let response):
                    guard let detail = response?.user else { return }
                    self.delegate?.userDetailFetched(id: detail.id, username: self.username)
                    
                case .failure(let error):
                    self.delegate?.userDetailError()
                    print(error)
            }
        }
    }
}

