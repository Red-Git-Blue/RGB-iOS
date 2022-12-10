import UIKit
import RxSwift
import RxCocoa
import Moya
import Then
import SnapKit
import RxRelay

class SignupViewController: UIViewController {
//    let provider = MoyaProvider<MyAPI>()
    
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5),
                      .font : UIFont.systemFont(ofSize: 14, weight: .bold)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.largestUndimmedDetentIdentifier = .large
            let id = UISheetPresentationController.Detent.Identifier("SignCustom")
            let SignCustomDetent = UISheetPresentationController.Detent.custom(identifier: id) { context in
                return 800
            }
            sheetPresentationController.detents = [SignCustomDetent]
        }
        self.isModalInPresentation = true
        let opacity = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let opacityView = UIVisualEffectView(effect: opacity)
        opacityView.frame = view.bounds
        opacityView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(opacityView)
        
        let view = SignupView()
        
        view.goLoginButton.rx.tap
            .bind {
                let SigninViewContoller = BackGroundViewController(type: .Login)
                SigninViewContoller.modalPresentationStyle = .fullScreen
                self.present(SigninViewContoller, animated: false)
            }
        
        
//        view.mainButton.rx.tap
//            .bind {
//                API.login(LoginRequest(email: view.firstTextField.text!, password: view.seconedTextField.text!)).request()
//                    .subscribe { response in
//                        switch response {
//                        case .success(let response):
//                            print(response.statusCode)
//                            print("성공")
//                        case .failure(let error):
//                            print(error)
//                            print("시발")
//                        }
//                    }.disposed(by: view.disposeBag)
//            }
        
        view.mainButton.rx.tap
            .bind {
                API.signup(SignRequest(email: view.seconedTextField.text!, password: view.passwordTextField.text!, name: view.firstTextField.text!)).request()
                    .subscribe { response in
                        switch response {
                            
                        case .success(let response):
                            print(response.statusCode)
                            print("성공")
                        case .failure(let error):
                            print(error)
                            print("시발")
                        }
                    }.disposed(by: view.disposeBag)
            }
        
        view.updateWith(self)
    }
        
//        view.mainButton.rx.tap
//            .bind {
//                if(view.firstTextField.text == nil || view.firstTextField.text!.isEmpty) {
//                    print("닉네임 없서")
//                    return
//                }
//                if(view.seconedTextField.text == nil || view.seconedTextField.text!.isEmpty) {
//                    print("비밀번호 없서")
//                    return
//                }
//                
//                self.provider.rx.request(.postSignUp(SignRequest(email: view.seconedTextField.text!, password: view.passwordTextField.text!, name: view.firstTextField.text!))).subscribe {
//                    response in
//                    switch response {
//                    case .success(let response):
//                        print(response.statusCode)
//                        
//                        break
//                    case .failure(let error):
//                        print("this error is \(error)")
//                    }
//                }
//            }
        
}

