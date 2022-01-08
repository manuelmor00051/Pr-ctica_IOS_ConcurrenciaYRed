//
//  UsersViewModel.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import Foundation

protocol UserViewDelegate: AnyObject {
    func userFetched()
    func errorFetchingUser()
}

final class UsersViewModel: ViewModel {
    
    let coordinator: UsersCoordinator
    var users = [DirectoryItem]()
    weak var delegate: UserViewDelegate?
    
    init(coordinator: UsersCoordinator) {
        self.coordinator = coordinator
    }
    
    func fetchUsers() {
        let request = LatestUserRequest()
        session.request(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let response):
                    guard let users = response?.directoryItems else { return }
                    self.users = users
                    self.delegate?.userFetched()
                    
                case .failure (let error):
                    self.delegate?.errorFetchingUser()
                    print(error)
            }
        }
    }
    
    func didSelectedRow(index: Int) {
        coordinator.didSelect(username: users[index].user.username)
    }
    
}
