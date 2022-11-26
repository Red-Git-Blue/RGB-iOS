import Foundation

struct UserGraphListModel: Decodable {
    let nowCoinPrice, changePercent : Int?
    let iTakeCoins, userImage, userName: String?
}
