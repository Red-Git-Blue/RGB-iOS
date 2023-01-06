import Foundation
import Moya

enum API {
    
    // login
    case login(LoginRequest)
    
    //Signup
    case signup(SignRequest)
    
    //user
    case getMeInfo
    case coinList
    
    //토큰 재발급
    case reissue(TokenModel)
    
    //shop
    case getBadgeShopList
    case getBadgeDetil(_ name: Int)
    case getCategoryList
    
    case getAllBadgesList
    
    //advertise
    case getAdvertiseNow
    
    //main
    case getCoinUserList
    
    //coin
    case getOwnedCoins
    
}

extension API: Moya.TargetType {
    var baseURL: URL { self.getBaseURL() }
    var path: String { self.getPath() }
    var method: Moya.Method { self.getMethod() }
    var sampleData: Data { Data() }
    var task: Task { self.getTask() }
    var headers: [String : String]? { self.header }
}

extension Encodable {
     func toDictionary() -> [String: Any] {
         do {
             let encoder = JSONEncoder()
             let data = try encoder.encode(self)

             return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] ?? [:]
         } catch {
             return [:]
         }
     }
 }

