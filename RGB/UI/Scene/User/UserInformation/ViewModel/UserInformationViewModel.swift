import UIKit
import RxRelay
import RxCocoa
import RxSwift

class UserInformationViewModel: BaseVM {
    private let disposeBag = DisposeBag()
    
    struct Input {
        let viewReceive: Driver<Void>
    }
    
    struct Output {
        let myPage: PublishRelay<UserMeInfoModel>
        let result: PublishRelay<Bool>
    }
    
    func trans(_ input: Input) -> Output {
        let api = Service()
        let myPage = PublishRelay<UserMeInfoModel>()
        let result = PublishRelay<Bool>()
        
        input.viewReceive.asObservable()
            .map { api.myPageLoad() }
            .subscribe{ data in
                data.map { datas in
                    datas.subscribe { data, res in
                        switch res {
                        case .ok:
                            myPage.accept(data!)
                            result.accept(true)
                            print("성공")
                        default:
                            result.accept(false)
                            print("펑!")
                        }
                    }.disposed(by: self.disposeBag)
                }
            }.disposed(by: disposeBag)
        
        return Output(myPage: myPage, result: result)
    }
}
