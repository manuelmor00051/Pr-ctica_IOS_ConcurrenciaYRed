//
//  LatestUserRequest.swift
//  DiscourseClient
//
//  Created by Manuel Moreno Cámara on 31/12/21.
//

import Foundation

struct LatestUserRequest: APIRequest {
    typealias Response = UsersResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/directory_items.json"
    }
    
    var parameters: [String : String] {
        return ["period" : "all"]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
