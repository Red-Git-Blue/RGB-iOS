import RxCocoa
import RxSwift
import UIKit
import Then
import SnapKit

class AdvertiosementSectionViewModel: BaseVM {
    private let disposeBag = DisposeBag()
    
    struct Input {
        let viewReceive: Driver<Void>
    }
    
    struct Output {
        let advertiseNow: PublishRelay<GetAdvertiseNowModel>
        let result: PublishRelay<Bool>
    }
    
    func trans(_ input: Input) -> Output {
        let api = Service()
        let advertiseNowList = PublishRelay<GetAdvertiseNowModel>()
        let result = PublishRelay<Bool>()
        
        input.viewReceive.asObservable()
            .map { api.getAdvertiseNowLoad() }
            .subscribe { data in
                data.map { datas in
                    datas.subscribe { data, res in
                        switch res {
                        case .ok:
                            advertiseNowList.accept(data!)
                            result.accept(true)
                            print("getAdvertiseNowLoad 성공")
                            
                        default:
                            result.accept(false)
                            print("getAdvertiseNowLoad가 터짐")
                        }
                    }.disposed(by: self.disposeBag)
                }
            }.disposed(by: disposeBag)
        
        return Output(advertiseNow: advertiseNowList, result: result)
    }
    
}
