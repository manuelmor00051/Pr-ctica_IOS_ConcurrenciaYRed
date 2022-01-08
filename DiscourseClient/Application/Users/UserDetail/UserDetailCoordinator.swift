//
//  UserDetailCoordinator.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import UIKit

final class UserDetailCoordinator: Coordinator {
    
    var navigator: UINavigationController
    let username: String
    
    init(navigator: UINavigationController, username: String) {
        self.navigator = navigator
        self.username = username
    }
    
    func start() {
        let userDetailVM = UserDetailViewModel(username: self.username, coordinator: self)
        let userDetailVC = UserDetailViewController(viewModel: userDetailVM)
        userDetailVC.title = "User detail"
        
        
        navigator.pushViewController(userDetailVC, animated: true)
    }
}
