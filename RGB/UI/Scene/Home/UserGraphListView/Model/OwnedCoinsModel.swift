//
//  OwnedCoinsModel.swift
//  RGB
//
//  Created by 박준하 on 2023/01/06.
//

import Foundation

// MARK: - OwnedCoinsModel
struct OwnedCoinsModel: Codable {
    let totalPages, totalElements, size: Int
    var content: [Content]
    let number: Int
    let sort: Sort
    let pageable: Pageable
    let numberOfElements: Int
    let first, last, empty: Bool
    
    // MARK: - Content
    struct Content: Codable {
        let coinID: Int
        let name, ownerName: String
        let startPrice, price, boughtPrice, boughtAmount: Int
        let previousPrice, maxPrice, minPrice, totalBuyCount: Int
        let totalSellCount: Int
        let increment: Increment
        let imageURL: ImageURL?
        let graph: [Graph]

        enum CodingKeys: String, CodingKey {
            case coinID = "coinId"
            case name, ownerName, startPrice, price, boughtPrice, boughtAmount, previousPrice, maxPrice, minPrice, totalBuyCount, totalSellCount, increment
            case imageURL = "imageUrl"
            case graph
        }
    }

    // MARK: - Graph
    struct Graph: Codable {
        let price, increment, date: Int
    }

    // MARK: - ImageURL
    struct ImageURL: Codable {
        let fileID: Int
        let fileURL, fileType, imageURLExtension, fileName: String

        enum CodingKeys: String, CodingKey {
            case fileID = "fileId"
            case fileURL = "fileUrl"
            case fileType
            case imageURLExtension = "extension"
            case fileName
        }
    }

    // MARK: - Increment
    struct Increment: Codable {
        let difference: Int
        let percent: Double
    }

    // MARK: - Pageable
    struct Pageable: Codable {
        let offset: Int
        let sort: Sort
        let pageNumber, pageSize: Int
        let paged, unpaged: Bool
    }

    // MARK: - Sort
    struct Sort: Codable {
        let empty, sorted, unsorted: Bool
    }

}
