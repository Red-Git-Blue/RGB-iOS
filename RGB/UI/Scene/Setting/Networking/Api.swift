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
    case login(LoginRequest)
    
    //Signup
    case signup(SignRequest)
    
    //user
    case getMeInfo
    
    //토큰 재발급
    case reissue(TokenModel)
    
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
    var task: Task { self.getTask() }
    var headers: [String : String]? { self.header }
}

extension Encodable {
     func toDictionary() -> [String: Any] {
         do {
             let encoder = JSONEncoder()
             let data = try encoder.encode(self)

             return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] ?? [:]
         } catch {
             return [:]
         }
     }
 }

