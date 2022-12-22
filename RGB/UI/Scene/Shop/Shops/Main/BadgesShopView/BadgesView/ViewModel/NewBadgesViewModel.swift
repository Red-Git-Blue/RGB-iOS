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
        let ShopBadgeView: PublishRelay<GetBadgeListModel>
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
                            print("샵을 드디어 끝냈다")
                            
                        default:
                            result.accept(false)
                            print("다시해야 할 듯(고쳐 터짐)")
                        }
                    }.disposed(by: self.disposeBag)
                }
            }.disposed(by: disposeBag)
        
        return Output(ShopBadgeView: shopBadgeList, result: result)
    }
    
}
