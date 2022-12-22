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
