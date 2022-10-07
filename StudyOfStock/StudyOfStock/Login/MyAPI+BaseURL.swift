//
//  MyAPI+BaseURL.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/10/07.
//

import Foundation

extension MyAPI {
  func getBaseURL() -> URL {
    return URL(string: "http://local.lite24.net:8080/")!
  }
}
