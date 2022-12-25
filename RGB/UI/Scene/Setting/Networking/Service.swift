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
                return .ok
            }
            .catch {[unowned self] in return .just(setNetworkError($0))}
    }

    func badgeDetailDataLoad(_ id: Int) -> Single<(GetBadgeDetailModel?, networkingResult)> {
        
        return provider.rx.request(.getBadgeDetil(id))
            .filterSuccessfulStatusCodes()
            .map(GetBadgeDetailModel.self)
            .map{
                print($0)
                return ($0, .ok)
            }
            .catch { error in
                print(error)
                return .just((nil, .fault))
            }
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
    
    func getAdvertiseNowLoad() -> Single<(GetAdvertiseNowModel?, networkingResult)> {
        return provider.rx.request(.getAdvertiseNow)
            .filterSuccessfulStatusCodes()
            .map(GetAdvertiseNowModel.self)
            .map {
                print($0)
                print("보냄")
                return ($0, .ok)
            }
            .catch { error in
                print(error)
                return .just((nil, .fault))
            }
    }
    
    func shopPageLoadBadge() -> Single<(GetBadgeShopListModel?, networkingResult)> {
        return provider.rx.request(.getBadgeShopList)
            .filterSuccessfulStatusCodes()
            .map(GetBadgeShopListModel.self)
            .map {
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
    
    func coinLists() -> Single<(GetCoinListModel?, networkingResult)> {
        print("코인 리스트 가져오는 중!")
        return provider.rx.request(.getMeInfo)
            .filterSuccessfulStatusCodes()
            .map(GetCoinListModel.self)
            .map{
                print($0)
                return ($0, .ok)
            }
            .catch { error in
                print(error)
                return .just((nil, .fault))
            }
    }
}
