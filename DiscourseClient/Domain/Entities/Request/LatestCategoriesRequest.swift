//
//  LatestCategoriesRequest.swift
//  DiscourseClient
//
//  Created by Manuel Moreno Cámara on 2/1/22.
//

import Foundation

struct LatestCategoriesRequest: APIRequest {
    typealias Response = CategoriesResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/categories.json"
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
