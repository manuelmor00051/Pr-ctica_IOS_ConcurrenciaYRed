//
//  UserDetailViewController.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    let viewModel: UserDetailViewModel
    
    
    init(viewModel: UserDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: "UserDetailViewController", bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchTopicDetail()
        DispatchQueue.main.async {
            self.showLoading()
        }
    }

}

extension UserDetailViewController: UserDetailDelegate {
    func userDetailFetched(id: Int, username: String) {
        hideLoading()
        self.userIDLabel.text = "\(self.userIDLabel.text ?? "") \(String(id))"
        self.userNameLabel.text = "\(self.userNameLabel.text ?? "") \(username)"
        
    }
    
    func userDetailError() {
        hideLoading()
        showAlert(title: "Error detail fetch")
    }
}
