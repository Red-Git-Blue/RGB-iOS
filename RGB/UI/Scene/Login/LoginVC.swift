import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit
import RxRelay

class LoginViewController: UIViewController {

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
                print("🐊:: LoginButton!")
            }
        
        view.forgetPasswordButton.rx.tap
            .bind {
                print("🙉:: ForgetPasswordButton!")
                let passwordViewContoller = PasswordBackGroundViewController()
                passwordViewContoller.modalPresentationStyle = .fullScreen
                self.present(passwordViewContoller, animated: false)
            }
        
        view.goSignupButton.rx.tap
            .bind {
                let SignupViewContoller = SignupBackGroundViewController()
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
