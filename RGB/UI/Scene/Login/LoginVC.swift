import UIKit
import Moya
import RxSwift
import RxCocoa
import Then
import SnapKit
import RxRelay

class LoginViewController: UIViewController {
    let provider = MoyaProvider<MyAPI>()

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
        let view = LoginView()
        
        view.mainButton.rx.tap
            .bind {
                if(view.firstTextField.text == nil || view.firstTextField.text!.isEmpty) {
                    print("닉네임 없서")
                    return
                }
                if(view.seconedTextField.text == nil || view.seconedTextField.text!.isEmpty) {
                    print("비밀번호 없서")
                    return
                }
                self.provider.rx.request(.postSignIn(LoginRequest(email: view.firstTextField.text!, password: view.seconedTextField.text!))).subscribe { response in
                    switch response {
                    case .success(let response):
                        print(response.statusCode)
                        print(String(data: response.data, encoding: .utf8))
                        if let userDate = try? JSONDecoder().decode(TokenModel.self, from: response.data) {
                            KeyChain.create(key: Token.accessToken, token: userDate.accessToken)
                            KeyChain.create(key: Token.refreshToken, token: userDate.refreshToken)
                            print("🥹안녕")
                        } else {
                            print("🔨")
                        }
                        let appVC = TapBarViewController()
                        appVC.modalPresentationStyle = .fullScreen
                        self.present(appVC, animated: false)
                        break
                    case .failure(let error):
                        print("펑! \(error)")
                    }
                }.disposed(by: view.disposeBag)
                print("🐊:: LoginButton!")
            }
        
        view.forgetPasswordButton.rx.tap
            .bind {
                print("🙉:: ForgetPasswordButton!")
                let passwordViewContoller = BackGroundViewController(type: .Password)
                passwordViewContoller.modalPresentationStyle = .fullScreen
                self.present(passwordViewContoller, animated: false)
            }
        
        view.goSignupButton.rx.tap
            .bind {
                let SignupViewContoller = BackGroundViewController(type: .Signup)
                SignupViewContoller.modalPresentationStyle = .fullScreen
                self.present(SignupViewContoller, animated: false)
            }
        
        view.updateWith(self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        view.endEditing(true)
    }
}
