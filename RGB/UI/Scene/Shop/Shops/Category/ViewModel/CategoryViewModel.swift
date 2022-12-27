import UIKit
import RxSwift
import RxCocoa

class CategoryViewModel {
    private let disposeBag = DisposeBag()
    
    struct Input {
        let viewReceive: Driver<Void>
    }
    
    struct Output {
        let categoryView: PublishRelay<GetCategoryListModel>
        let result: PublishRelay<Bool>
    }
    
    func trans(_ input: Input) -> Output {
        let api = Service()
        let categoryList = PublishRelay<GetCategoryListModel>()
        let result = PublishRelay<Bool>()
        
        print("category trans를 거침")
        
        input.viewReceive.asObservable()
            .map { api.getCategoryListLoad() }
            .subscribe { data in
                data.map { datas in
                    datas.subscribe { data, res in
                        
                        print("구독도됨")
                        
                        switch res {
                        case .ok:
                            categoryList.accept(data!)
                            result.accept(true)
                            print("shopPageLoadBadge 성공")
                            
                        default:
                            result.accept(false)
                            print("shopPageLoadBadge가 터짐")
                        }
                    }.disposed(by: self.disposeBag)
                }
            }.disposed(by: disposeBag)
        
        return Output(categoryView: categoryList, result: result)
    }
}
