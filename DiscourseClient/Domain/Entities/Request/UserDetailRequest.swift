//
//  UserDetailRequest.swift
//  DiscourseClient
//
//  Created by Manuel Moreno Cámara on 31/12/21.
//

import Foundation

struct UserDetailRequest: APIRequest {
    
    typealias Response = UserDetailResponse
    
    let username: String
    
    init(username: String) {
        self.username = username
    }
    
    var method: Method {
        .GET
    }
    
    var path: String {
        "/users/\(username).json"
    }
    
    var parameters: [String : String] {
        [:]
    }
    
    var body: [String : Any] {
        [:]
    }
    
    var headers: [String : String] {
        [:]
    }
    
}
