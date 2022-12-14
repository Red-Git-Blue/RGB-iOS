import Foundation
import Moya

extension MyAPI {
  func getMethod() -> Moya.Method {
    switch self {
    case .postSignUp: return .post
    case .postSignIn: return .post
    case .getBagesList: return .get
    case .getMeInfo: return .get
    }
  }
}
