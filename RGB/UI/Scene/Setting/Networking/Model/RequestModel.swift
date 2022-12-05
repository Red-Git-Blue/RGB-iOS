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

struct BagesListRequest: ModelType {
    var idx: Int
    var size: Int
}

struct BagesListModel: Codable {
    let totalPages, totalElements, size: Int
    let content: [Content]
    let number: Int
    let sort: Sort
    let first, last: Bool
    let numberOfElements: Int
    let pageable: Pageable
    let empty: Bool
}

// MARK: - Content
struct Content: Codable {
    let id: Int
    let name: String
    let tagList: [TagList]
    let badgeMainFile: BadgeMainFile
}

// MARK: - BadgeMainFile
struct BadgeMainFile: Codable {
    let fileID: Int
    let fileURL, fileType, badgeMainFileExtension, fileName: String

    enum CodingKeys: String, CodingKey {
        case fileID = "fileId"
        case fileURL = "fileUrl"
        case fileType
        case badgeMainFileExtension = "extension"
        case fileName
    }
}

// MARK: - TagList
struct TagList: Codable {
    let tagName: String
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


