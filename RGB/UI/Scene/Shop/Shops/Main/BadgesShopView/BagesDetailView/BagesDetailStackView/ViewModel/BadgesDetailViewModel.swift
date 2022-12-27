import UIKit
import RxRelay
import RxCocoa
import RxSwift


class BadgesDetailViewModel {
    private let disposeBag = DisposeBag()
    
    struct Input {
        let viewReceive: Driver<Void>
        let id: Int
    }
    
    struct Output {
        let badgeDetailData: PublishRelay<GetBadgeDetailModel>
        let result: PublishRelay<Bool>
    }
    
    func trans(_ input: Input) -> Output {
        let api = Service()
        let badgeDetailList = PublishRelay<GetBadgeDetailModel>()
        let result = PublishRelay<Bool>()
        
        print("trans를 거친다")
        
        print("dhdhdhdh \(input.id)")
        
        api.badgeDetailDataLoad(input.id).subscribe { data, res in
            print("trans 구독은 됐음")
            switch res {
            case .ok:
                badgeDetailList.accept(data!)
                result.accept(true)
                print("badgeDetailDataLoad 성공")
                
            default:
                print("badgeDetailDataLoad 실패")
                result.accept(false)
            }
        }
        
//        input.viewReceive.asObservable()
//            .map { api.badgeDetailDataLoad(input.id)}
//            .subscribe { data in
//                data.map { datas in
//                    datas.subscribe { data, res in
//
//                        print("trans 구독은 됐음")
//                        switch res {
//                        case .ok:
//                            badgeDetailList.accept(data!)
//                            result.accept(true)
//                            print("badgeDetailDataLoad 성공")
//
//
//                        default:
//                            print("badgeDetailDataLoad 실패")
//                            result.accept(false)
//                        }
//                    }.disposed(by: self.disposeBag)
//                }
//            }.disposed(by: disposeBag)
        
        return Output(badgeDetailData: badgeDetailList, result: result)
        
    }
    
}
