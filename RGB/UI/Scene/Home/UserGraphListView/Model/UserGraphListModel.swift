//
//  File.swift
//  RGB
//
//  Created by 박준하 on 2022/11/25.
//

import Foundation

struct UserGraphListModel: Decodable {
    let nowCoinPrice, changePercent : Int?
    let iTakeCoins, userImage, userName: String?
}
