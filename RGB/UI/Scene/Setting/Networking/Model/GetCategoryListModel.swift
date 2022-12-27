//
//  GetCategoryListModel.swift
//  RGB
//
//  Created by 박준하 on 2022/12/27.
//

import Foundation

// MARK: - GetCategoryListModel
struct GetCategoryListModel: Codable {
    let totalPages, totalElements, size: Int
    let content: [Content]
    let number: Int
    let sort: Sort
    let pageable: Pageable
    let first, last: Bool
    let numberOfElements: Int
    let empty: Bool
    
    
    // MARK: - Content
    struct Content: Codable {
        let categoryName: String
        let color: Color
        let categoryIcon: CategoryIcon
    }

    // MARK: - CategoryIcon
    struct CategoryIcon: Codable {
        let fileID: Int
        let fileURL, fileType, categoryIconExtension, fileName: String

        enum CodingKeys: String, CodingKey {
            case fileID = "fileId"
            case fileURL = "fileUrl"
            case fileType
            case categoryIconExtension = "extension"
            case fileName
        }
    }

    // MARK: - Color
    struct Color: Codable {
        let startColor, endColor: String
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
