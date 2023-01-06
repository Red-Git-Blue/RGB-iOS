import Foundation
import RxSwift
import RxCocoa
import RxRelay

class UserGraphListSectionViewModel {
    private let disposeBag = DisposeBag()
    
    struct Input {
        let viewReceive: Driver<Void>
    }
    
    struct Output {
        let graphModelList: PublishRelay<OwnedCoinsModel>
        let result: PublishRelay<Bool>
    }
    
    func trans(_ input: Input) -> Output {
        let api = Service()
        let graphList = PublishRelay<OwnedCoinsModel>()
        let result = PublishRelay<Bool>()
        
        print("suggestionCoinViewModel은 trans를 거침")
        
        api.getOwnedCoinsLoad().subscribe(onSuccess: { data, res in
            switch res {
            case .ok:
                graphList.accept(data!)
                result.accept(true)
                
            default:
                result.accept(false)
            }
        })
        
        input.viewReceive.asObservable()
            .map { api.getOwnedCoinsLoad() }
            .subscribe { data in
                data.map { datas in
                    datas.subscribe { data, res in
                        switch res {
                        case .ok:
                            graphList.accept(data!)
                            result.accept(true)
                            print("GetCoinUserListModel 성공")
                            
                        default:
                            result.accept(false)
                            print("GetCoinUserListModel 실패")
                        }
                    }.disposed(by: self.disposeBag)
                }
            }.disposed(by: disposeBag)
        
        return Output(graphModelList: graphList, result: result)
    }
}

