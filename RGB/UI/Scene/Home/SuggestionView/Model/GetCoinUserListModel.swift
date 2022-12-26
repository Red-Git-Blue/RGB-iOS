import Foundation

// MARK: - GetSuggesionModel
struct GetCoinUserListModel: Codable {
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
        let id: Int
        let name, ownerName: String
        let startPrice, price, increment: Int
        let imageURL: ImageURL

        enum CodingKeys: String, CodingKey {
            case id, name, ownerName, startPrice, price, increment
            case imageURL = "imageUrl"
        }
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
