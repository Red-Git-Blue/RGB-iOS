import Foundation
import Moya

extension MyAPI {
  func getPath() -> String {
    switch self {
    case .postSignUp:
        return "/api/auth/sign-up"
    case .postSignIn:
        return "/api/auth/sign-in"
        
    }
  }
}
