import Foundation
import RxSwift
import RxCocoa
import RxRelay

class SuggestionCoinViewModel: BaseVM {
    private let disposeBag = DisposeBag()
    
    struct Input {
        let viewReceive: Driver<Void>
    }
    
    struct Output {
        let coinList: PublishRelay<GetCoinUserListModel>
        let result: PublishRelay<Bool>
    }
    
    func trans(_ input: Input) -> Output {
        let api = Service()
        let coinList = PublishRelay<GetCoinUserListModel>()
        let result = PublishRelay<Bool>()

        print("suggestionCoinViewModel은 trans를 거침")
        
        api.coinUserList().subscribe(onSuccess: { data, res in
            switch res {
            case .ok:
                coinList.accept(data!)
                result.accept(true)
                
            default:
                result.accept(false)
            }
        })
        
//        input.viewReceive.asObservable()
//            .map { api.coinUserList() }
//            .subscribe { data in
//                data.map { datas in
//                    datas.subscribe { data, res in
//                        switch res {
//                        case .ok:
//                            coinList.accept(data!)
//                            result.accept(true)
//                            print("GetCoinUserListModel 성공")
//
//                        default:
//                            result.accept(false)
//                            print("GetCoinUserListModel 실패")
//                        }
//                    }.disposed(by: self.disposeBag)
//                }
//            }.disposed(by: disposeBag)
        
        return Output(coinList: coinList, result: result)
    }
}
