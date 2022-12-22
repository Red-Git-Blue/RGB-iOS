//
//  GetBadgeShopListModel.swift
//  RGB
//
//  Created by 박준하 on 2022/12/22.
//

import Foundation

// MARK: - GetAdvertiseNowModel
struct GetBadgeShopListModel: Codable {
    let totalPages, totalElements, size: Int
    let content: [Content]
    let number: Int
    let sort: Sort
    let pageable: Pageable
    let first, last: Bool
    let numberOfElements: Int
    let empty: Bool
    
    struct Content: Codable {
        let id: Int
        let introduction, name: String
        let price: Int
        let rarityType: String
        let badgeMainFile: BadgeMainFile
    }
}
