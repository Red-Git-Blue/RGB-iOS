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
        let email: Driver<String>
        let password: Driver<String>
        let name: Driver<String>
        let signupButtonDidTap: Single<Void>
    }
    
    struct Output {
        let result: PublishRelay<Bool>
    }
    
    func trans(_ input: Input) -> Output {
        let api = Service()
        let info = Driver.combineLatest(input.email, input.password, input.name)
        let result = PublishRelay<Bool>()
        input.signupButtonDidTap
            .asObservable()
            .withLatestFrom(info)
            .flatMap { email, password, name in
                api.signup(email, password, name)
            }.subscribe(onNext: { r in
                print("버튼이 클릭 됨")
                switch r {
                case .ok:
                    result.accept(true)
                default:
                    result.accept(false)
                }
            }).disposed(by: disposeBag)
        
        return Output(result: result)
    }
}
