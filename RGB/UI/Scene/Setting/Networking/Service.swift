import Foundation
import RxSwift
import RxCocoa
import Moya

final class Service {
    
    let provider = MoyaProvider<API>(plugins: [MoyaLoggingPlugin()])
    
    func login(_ email: String, _ password: String) -> Single<networkingResult> {
        return provider.rx.request(.login(LoginRequest(email: email, password: password)))
            .filterSuccessfulStatusCodes()
            .map(TokenModel.self)
            .map{ response -> networkingResult in
                Token.accessToken = response.accessToken
                Token.refreshToken = response.refreshToken
                return .ok
            }
            .catch {[unowned self] in return .just(setNetworkError($0))}
    }
    func signup(_ email: String, _ password: String, _ name: String) -> Single<networkingResult> {
        return provider.rx.request(.signup(SignRequest(email: email, password: password, name: name)))
            .filterSuccessfulStatusCodes()
            .map{ response -> networkingResult in
                return .createOk
            }
            .catch {[unowned self] in return .just(setNetworkError($0))}
    }
    
    func myPageLoad() -> Single<(UserMeInfoModel?, networkingResult)> {
        print("ㅗㅗㅗㅗㅗ")
        return provider.rx.request(.getMeInfo)
            .filterSuccessfulStatusCodes()
            .map(UserMeInfoModel.self)
            .map{
                print($0)
                return ($0, .ok)
            }
            .catch { error in
                print(error)
                return .just((nil, .fault))
            }
    }
    
    func setNetworkError(_ error: Error) -> networkingResult {
            print(error)
            print(error.localizedDescription)
            guard let status = (error as? MoyaError)?.response?.statusCode else { return (.fault) }
            return (networkingResult(rawValue: status) ?? .fault)
    }
}
