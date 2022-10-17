//
//  RequestModel.swift
//  RGB
//
//  Created by 박준하 on 2022/10/17.
//

import Foundation

struct SignRequest: ModelType {
    var email: String
    var password: String
    var name: String
}

struct LoginRequest: ModelType {
    var email: String
    var password: String
}
