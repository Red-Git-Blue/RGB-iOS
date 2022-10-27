import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit
import RxRelay

class SignupViewController: UIViewController {
    
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
                let SigninViewContoller = SigninBackGroundViewController()
                SigninViewContoller.modalPresentationStyle = .fullScreen
                self.present(SigninViewContoller, animated: false)
            }
        
        view.updateWith(self)
    }
}
