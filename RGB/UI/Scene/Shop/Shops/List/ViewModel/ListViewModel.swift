import UIKit
import RxRelay
import RxCocoa
import RxSwift

class ListViewModel: BaseVM {
    private let disposeBag = DisposeBag()
    
    struct Input {
        let viewReceive: Driver<Void>
    }
    
    struct Output {
        let allBadgeView: PublishRelay<GetAllBadgesListModel>
        let result: PublishRelay<Bool>
    }
    
    func trans(_ input: Input) -> Output {
        let api = Service()
        let allBadgesList = PublishRelay<GetAllBadgesListModel>()
        let result = PublishRelay<Bool>()
        
        print("trans 작동")
        
        input.viewReceive.asObservable()
            .map { api.getAllBadgesListDataLoad()}
            .subscribe { data in
                data.map { datas in
                    datas.subscribe { data, res in
                        
                        print("allbadgesList 작동")
                        switch res {
                        case .ok:
                            allBadgesList.accept(data!)
                            result.accept(true)
                            print("allBadgesList 성공")
                            
                        default:
                            result.accept(false)
                            print("allBadgesList가 터짐")
                        }
                    }.disposed(by: self.disposeBag)
                }
            }.disposed(by: disposeBag)
        
        return Output(allBadgeView: allBadgesList, result: result)
    }
}
