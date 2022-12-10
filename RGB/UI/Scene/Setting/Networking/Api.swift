//
//  Api.swift
//  RGB
//
//  Created by 박준하 on 2022/12/10.
//

import Foundation
import Moya

enum API {
    
    // login
    case login
    
    //Signup
    case signup
    
    // Commit
    
    case allCommit(_ name : String)
    case dayCommit(_ name: String)
    case weekCommit(_ name: String)
    case mounthCommit(_ name: String)
    case yearCommit(_ name: String)
    
    // Commit Array
    
    case weekArray(_ name: String)
    case monthArray(_ name: String)
    case yearArray(_ name: String)
    
    // Github API User
    
    case getUserProfile(_ name: String)
    case getUserStarred(_ name: String)
    case getUserFollowing(_ name : String)
    
}

extension API: Moya.TargetType {
    var baseURL: URL { self.getBaseURL() }
    var path: String { self.getPath() }
    var method: Moya.Method { self.getMethod() }
    var sampleData: Data { Data() }
    var task: Task {  return .requestPlain }
    var headers: [String : String]? { ["Content-Type": "application/json"] }
}


