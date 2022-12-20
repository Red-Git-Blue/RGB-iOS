//
//  GetCoinListModel.swift
//  RGB
//
//  Created by 박준하 on 2022/12/20.
//

struct GetCoinListModel: Codable {
    let totalPages, totalElements, size: Int
    let content: [Content]
    let number: Int
    let sort: Sort
    let pageable: Pageable
    let first, last: Bool
    let numberOfElements: Int
    let empty: Bool
}
