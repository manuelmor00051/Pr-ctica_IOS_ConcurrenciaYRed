//
//  CategoryDetailRequest.swift
//  DiscourseClient
//
//  Created by Manuel Moreno Cámara on 2/1/22.
//

import Foundation
struct CategoryDetailRequest: APIRequest {
    typealias Response = CategoryDetailResponse
    
    let id: String
    
    init(id: Int) {
        self.id = String(id)
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/c/\(id)/show.json"
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
