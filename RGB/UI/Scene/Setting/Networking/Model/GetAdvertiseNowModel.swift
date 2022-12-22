import Foundation

// MARK: - GetAdvertiseNowModel
struct GetAdvertiseNowModel: Codable {
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
        let name: String
        let advertiseFile: AdvertiseFile
    }
}

struct AdvertiseFile: Codable {
    let fileID: Int
    let fileURL, fileType, advertiseFileExtension, fileName: String

    enum CodingKeys: String, CodingKey {
        case fileID = "fileId"
        case fileURL = "fileUrl"
        case fileType
        case advertiseFileExtension = "extension"
        case fileName
    }
}
