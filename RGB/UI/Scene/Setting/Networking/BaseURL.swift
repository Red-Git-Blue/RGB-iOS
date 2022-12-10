//
//  BaseURL.swift
//  RGB
//
//  Created by 박준하 on 2022/12/10.
//
import Foundation
import Moya

let url = "http://local.lite24.net:8080/api/rgb/v1"

extension API {
    
    func getBaseURL() -> URL {
        switch self {
            
        case .allCommit(_), .dayCommit(_), .weekCommit(_), .mounthCommit(_), .yearCommit(_):
            return URL(string: url)!
            
        case .weekArray(_), .monthArray(_), .yearArray(_):
            return URL(string: url)!
            
        case .getUserProfile(_), .getUserStarred(_), .getUserFollowing(_):
            return URL(string: url)!
        case .login, .signup:
            return URL(string: url)!
            
        case .getMeInfo:
            return URL(string: url)!
        }
    }
    func getPath() -> String {
        switch self {
        case .allCommit(let username):
            return "/\(username)"
        case .dayCommit(let username):
            return "/\(username)/daycount"
        case .weekCommit(let username):
            return "/\(username)/weekcount"
        case .mounthCommit(let username):
            return "/\(username)/monthcount"
        case .yearCommit(let username):
            return "/\(username)/yearcount"
        case .weekArray(let username):
            return "/\(username)/weekarray"
        case .monthArray(let username):
            return "/\(username)/montharray"
        case .yearArray(let username):
            return "/\(username)/yeararray"
        case .getUserProfile(let username):
            return "users/\(username)"
        case .getUserStarred(let username):
            return "users/\(username)/starred"
        case .getUserFollowing(let username):
            return "users/\(username)/following"
        case .login:
            return "/auth/sign-in"
        case .signup:
            return "/auth/sign-up"
        case .getMeInfo:
            return "/user/me"
        }
    }
    func getMethod() -> Moya.Method {
        switch self {
        case .login: return .post
        case .signup: return .post
        default: return .get
        }
    }
    
    func getTask() -> Task {
        switch self {
            
        case .login(let body):
            return .requestParameters(
                parameters: body.toDictionary(),
                encoding: JSONEncoding.default
            )
        case .signup(let body):
            return .requestParameters(
                parameters: body.toDictionary(),
                encoding: JSONEncoding.default
            )
        default:
            return .requestPlain
        }
    }
}
