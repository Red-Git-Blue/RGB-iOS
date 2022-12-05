import Foundation
import Moya

extension MyAPI {
  func getPath() -> String {
    switch self {
    case .postSignUp:
        return "/auth/sign-up"
    case .postSignIn:
        return "/auth/sign-in"
    case .getBagesList:
        return "item/badge"
        
    }
  }
}
