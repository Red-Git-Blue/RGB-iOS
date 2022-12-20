//
//  SignupViewModel.swift
//  RGB
//
//  Created by 박준하 on 2022/12/14.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class SignupViewModel: BaseVM {
    private let disposeBag = DisposeBag()
    
    struct Input {
        let name: Driver<String>
        let email: Driver<String>
        let password: Driver<String>
        let signupButtonDidTap: ControlEvent<Void>
    }
    
    struct Output {
        let result : PublishRelay<Bool>
    }
    
    func trans(_ input: Input) -> Output {
        let api = Service()
        let info = Driver.combineLatest(input.name, input.email, input.password)
        let result = PublishRelay<Bool>()
        print("Aaaaaaaaaaaaaaaaaaaaaaaaaasdf")
        print(input.signupButtonDidTap
            .asObservable()
            .withLatestFrom(info)
            .flatMap { n, e, p in
                return api.signup(n, e, p)
            }
            .subscribe (onNext: { r in
                print("버튼이 클릭 됨")
                switch r {
                case .ok:
                    result.accept(true)
                default:
                    result.accept(false)
                }
            })
        )
        
        return Output(result: result)
    }
}
