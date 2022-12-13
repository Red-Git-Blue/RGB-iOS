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
//        input.viewReceive.asObservable()
//            .flatMap(api.myPageLoad())
//            .subscribe(onNext: { data, res in
//                print("난 보내지 않았어!!! data: \(String(describing: data)) res: \(res)")
//                switch res {
//                case .ok:
//                    myPage.accept(data!)
//                    result.accept(true)
//                    print("성공")
//                default:
//                    print("실패")
//                    result.accept(false)
//                }
//            })
//            .disposed(by: disposeBag)
        
//        print("1")
//        input.viewReceive.asObservable()
//            .map { api.myPageLoad() }
//            .subscribe { data in
//                print("3")
//                data.map { datas in
//                    print("4")
//                    datas.subscribe { data, res in
//                        print("5")
//                    }.disposed(by: self.disposeBag)
//                }
//            }.disposed(by: disposeBag)
        
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

//        input.viewReceive.asObservable()
//            .flatMap { api.myPageLoad() }
//            .subscribe(onNext: { data, res in
//                print("난 보내지 않았어!!! data: \(String(describing: data)) res: \(res)")
//                switch res {
//                case .ok:
//                    myPage.accept(data!)
//                    result.accept(true)
//                    print("성공")
//                default:
//                    print("실패")
//                    result.accept(false)
//                }
//            })
//            .disposed(by: disposeBag)
        
        return Output(myPage: myPage, result: result)
    }
}
