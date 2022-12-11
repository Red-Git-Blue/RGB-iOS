//
//  LoginViewModel.swift
//  RGB
//
//  Created by 박준하 on 2022/12/11.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class LoginViewModel: BaseVM {
    private let disposeBag = DisposeBag()
    
    struct Input {
        let email: Driver<String>
        let password: Driver<String>
        let loginButtonDidTap: Signal<Void>
    }
    
    struct Output {
        let result : PublishRelay<Bool>
    }
    
    func returnData(_ input: Input) -> Output {
        let api = Service()
        let info = Driver.combineLatest(input.email, input.password)
        let result = PublishRelay<Bool>()
        input.loginButtonDidTap
            .asObservable()
            .withLatestFrom(info)
            .flatMap{ email, password in
                api.login(email, password)
            }.subscribe(onNext: { r in
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
