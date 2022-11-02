//
//  UserGraphListModel.swift
//  RGB
//
//  Created by 박준하 on 2022/11/01.
//

import Foundation

struct UserGraphListModel: Decodable {
    let nowCoinPrice, changePercent : Int?
    let iTakeCoins, UserImage, userName: String?
}
