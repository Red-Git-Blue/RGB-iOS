import Foundation

struct SignRequest: Codable {
    var email: String
    var password: String
    var name: String
}

struct LoginRequest: Codable {
    var email: String
    var password: String
}

struct BagesListRequest: Codable {
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


// MARK: - UserMeInfoModel
struct UserMeInfoModel: Codable {
    let id: Int
    let email, name, userName: String
    let money: Int
    let representBadge, profile: Profile
    let badgeInfo: BadgeInfo
    let grassInfo: GrassInfo
    let github: Bool
}

// MARK: - BadgeInfo
struct BadgeInfo: Codable {
    let badgeQuantity: Int
    let slot: [Slot]
}

// MARK: - Slot
struct Slot: Codable {
    let id: Int
    let badgeMainFile: Profile
}

// MARK: - Profile
struct Profile: Codable {
    let fileID: Int
    let fileURL, fileType, profileExtension, fileName: String

    enum CodingKeys: String, CodingKey {
        case fileID = "fileId"
        case fileURL = "fileUrl"
        case fileType
        case profileExtension = "extension"
        case fileName
    }
}

// MARK: - GrassInfo
struct GrassInfo: Codable {
    let grassQuantity: Int
    let currentGrass: CurrentGrass
    let grassList: [CurrentGrass]
}

// MARK: - CurrentGrass
struct CurrentGrass: Codable {
    let id: Int
    let name, rarityType: String
    let color: Color
}

// MARK: - Color
struct Color: Codable {
    let less, low, normal, high: String
    let max, background: String
}
