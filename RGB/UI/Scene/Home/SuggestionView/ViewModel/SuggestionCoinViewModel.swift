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
        let coinList: PublishRelay<GetCoinListModel>
        let result: PublishRelay<Bool>
    }
    
    func trans(_ input: Input) -> Output {
        let api = Service()
        let coinList = PublishRelay<GetCoinListModel>()
        let result = PublishRelay<Bool>()
        
        input.viewReceive.asObservable()
            .map { api.coinLists() }
            .subscribe { datas in
                datas.subscribe { data, res in
                    switch res {
                    case .ok:
                        coinList.accept(data!)
                        result.accept(true)
                        print("성공")
                    default:
                        result.accept(false)
                        print("아잇")
                    }
                }.disposed(by: self.disposeBag)
            }.disposed(by: disposeBag)
        
        return Output(coinList: coinList, result: result)
    }
}
