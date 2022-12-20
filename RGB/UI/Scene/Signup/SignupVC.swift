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
        
        print("viewModel Signup")
        
        let view = SignupView()
        let viewModel = SignupViewModel()
        
        view.seconedTextField.text = "goodjunha@gmail.com"
        view.passwordTextField.text = "Junha85817469!"
        view.firstTextField.text = "박준하"
        
        let input = SignupViewModel.Input(
            name: view.firstTextField.rx.text.orEmpty.asDriver(),
            email: view.seconedTextField.rx.text.orEmpty.asDriver(),
            password: view.passwordTextField.rx.text.orEmpty.asDriver(),
            signupButtonDidTap: view.mainButton.rx.tap
        )
        
        
        let output = viewModel.trans(input)
        
        output.result.subscribe(onNext: {
            switch $0 {
            case true:
                print("signup 성공")
                let appVC = AppViewController()
                appVC.modalPresentationStyle = .fullScreen
                self.present(appVC, animated: false)
            case false:
                print("signup 실패")
            }
        }).disposed(by: view.disposeBag)
        
        view.updateWith(self)
    }
}

