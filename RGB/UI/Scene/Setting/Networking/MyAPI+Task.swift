import Foundation
import Moya

extension MyAPI {
    func getTask() -> Task {
        switch self {
        case .postSignIn(let body):
            return .requestParameters(
                parameters: body.toDictionary(),
                encoding: JSONEncoding.default
            )
        case .postSignUp(let body):
            return .requestParameters(
                parameters: body.toDictionary(),
                encoding: JSONEncoding.default
            )
        case .getBagesList(let body):
            return .requestParameters(
                parameters: body.toDictionary(),
                encoding: JSONEncoding.default
            )
            
        case .getMeInfo:
            return .requestPlain
        }
    }
}
