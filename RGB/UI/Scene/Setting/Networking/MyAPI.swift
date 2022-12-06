import Foundation
import Moya

enum MyAPI {
    case postSignUp(SignRequest)
    case postSignIn(LoginRequest)
    case getBagesList(BagesListRequest)
}

// MARK: MyAPI+TargetType
extension MyAPI: Moya.TargetType {
    var baseURL: URL { self.getBaseURL() }
    var path: String { self.getPath() }
    var method: Moya.Method { self.getMethod() }
    var sampleData: Data { Data() }
    var task: Task { self.getTask() }
    var headers: [String : String]? { ["Content-Type": "application/json"] }
    
//    func getHeader() -> [String : String]? {
//        var header = self.headers!
//        let token = KeyChain.read(key: Token.accessToken)
//        if(token != nil) {
//            header["Authorization"] = "Bearer \(token!)"
//        }
//        return header
//    }
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
