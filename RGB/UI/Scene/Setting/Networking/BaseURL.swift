import Foundation
import Moya

let url = "http://local.lite24.net/api/rgb/v1"

extension API {
    
    func getBaseURL() -> URL {
        switch self {
        case .login, .signup:
            return URL(string: url)!
            
        case .getMeInfo:
            return URL(string: url)!
            
        case .reissue:
            return URL(string: url)!
            
        case .coinList:
            return URL(string: url)!
            
        case .getBadgeShopList:
            return URL(string: url)!
            
        case .getAdvertiseNow:
            return URL(string: url)!
        case .getBadgeDetil(_):
            return URL(string: url)!
        case .getAllBadgesList:
            return URL(string: url)!
        case .getCoinUserList:
            return URL(string: url)!
        case .getCategoryList:
            return URL(string: url)!
        case .getOwnedCoins:
            return URL(string: url)!
        }
    }
    func getPath() -> String {
        switch self {
        case .login:
            return "/auth/sign-in"
        case .signup:
            return "/auth/sign-up"
        case .getMeInfo:
            return "/user/me"
        case .reissue:
            return "auth/reissue"
        case .coinList:
            return "/coin/list"
        case .getBadgeShopList:
            return "/item/badge/details"
        case .getAdvertiseNow:
            return "/advertise/now"
        case .getBadgeDetil(let id):
            return "/item/badge/\(id)"
        case .getCoinUserList:
            return "/coin/list"
        case .getAllBadgesList:
            return "/item/badge"
        case .getCategoryList:
            return "/item/category"
        case .getOwnedCoins:
            return "/coin"
        }
    }
    func getMethod() -> Moya.Method {
        switch self {
        case .login: return .post
        case .signup: return .post
        case .reissue: return .post
        default: return .get
        }
    }
    
    func getTask() -> Task {
        switch self {
            
        case .login(let body):
            return .requestParameters(
                parameters: body.toDictionary(),
                encoding: JSONEncoding.default
            )
        case .signup(let body):
            return .requestParameters(
                parameters: body.toDictionary(),
                encoding: JSONEncoding.default
            )
        default:
            return .requestPlain
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .login, .signup:
            return Header.tokenIsEmpty.header()
            
        case .reissue:
            return Header.refreshToken.header()
            
        default:
            return Header.accessToken.header()
        }
    }
}
