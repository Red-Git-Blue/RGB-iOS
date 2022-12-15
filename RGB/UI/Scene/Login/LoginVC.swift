import UIKit
import Moya
import RxSwift
import RxCocoa
import Then
import SnapKit
import RxRelay

class LoginViewController: UIViewController {
//    let provider = MoyaProvider<API>()
    let viewModel = LoginViewModel()
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
        view.firstTextField.text = "goodjunha@gmail.com"
        view.seconedTextField.text = "Junha85817469!"
        
        let input = LoginViewModel.Input(email: view.firstTextField.rx.text.orEmpty.asDriver(), password: view.seconedTextField.rx.text.orEmpty.asDriver(), loginButtonDidTap: view.mainButton.rx.tap.asSignal())
        
        let output = viewModel.trans(input)
        print("안녕")
        output.result.subscribe(onNext: {
            
            switch $0 {
            case true:
                print("login 성공")
                let tabBarVC = TapBarViewController()
                tabBarVC.modalPresentationStyle = .fullScreen
                self.present(tabBarVC, animated: false)
            case false:
                print("login 실패")
            }
        }).disposed(by: view.disposeBag)

        
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
