//
//  UsersCoordinator.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import UIKit

final class UsersCoordinator: Coordinator {
    var navigator: UINavigationController
        
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func start() {
        let usersViewModel = UsersViewModel(coordinator: self)
        let usersViewController = UsersViewController(viewModel: usersViewModel)
        usersViewController.title = "Users"

        navigator.pushViewController(usersViewController, animated: false)
    }
    
    func didSelect(username: String) {
        let userDetailCoordinator = UserDetailCoordinator(navigator: self.navigator, username: username)
        userDetailCoordinator.start()
    }
}
