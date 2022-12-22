import Foundation
import RxCocoa
import RxSwift
import UIKit
import Then

class BadgesViewModel: BaseVM {
    private let disposeBag = DisposeBag()
    
    struct Input {
        let viewReceive: Driver<Void>
    }
    
    struct Output {
        let shopBadgeView: PublishRelay<GetBadgeListModel>
        let result: PublishRelay<Bool>
    }
    
    func trans(_ input: Input) -> Output {
        let api = Service()
        let shopBadgeList = PublishRelay<GetBadgeListModel>()
        let result = PublishRelay<Bool>()
        
        input.viewReceive.asObservable()
            .map { api.shopPageLoadBadge()}
            .subscribe { data in
                data.map { datas in
                    datas.subscribe { data, res in
                        switch res {
                        case .ok:
                            shopBadgeList.accept(data!)
                            result.accept(true)
                            print("shopPageLoadBadge 성공")
                            
                        default:
                            result.accept(false)
                            print("shopPageLoadBadge가 터짐")
                        }
                    }.disposed(by: self.disposeBag)
                }
            }.disposed(by: disposeBag)
        
        return Output(shopBadgeView: shopBadgeList, result: result)
    }
    
}
