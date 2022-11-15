//
//  MainSignupVC.swift
//  RGB
//
//  Created by 박준하 on 2022/10/18.
//

import UIKit
import RxCocoa
import RxSwift
import Then
import SnapKit
import Charts

class MainSignupViewController: UIViewController {
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
        print("ㅗㅗㅗㅗㅗㅗ")
        self.isModalInPresentation = true
        let opacity = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let opacityView = UIVisualEffectView(effect: opacity)
        opacityView.frame = view.bounds
        opacityView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(opacityView)
        setupLayout()
    }
    
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5),
        .font : UIFont.systemFont(ofSize: 14, weight: .bold)]
    
    let disposeBag = DisposeBag()
    
    internal lazy var firstText = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 24.0, weight: .bold)
        $0.text = "아직 회원이 아니신가요?"
    }
    
    internal lazy var seconedText = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18.0, weight: .thin)
        $0.text = "이메일 인증으로 간편하게 인증해보세요."
    }
    
    internal lazy var firstTextFieldLable = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18.0, weight: .semibold)
        $0.text = "닉네임"
    }
    
    internal lazy var firstTextField = UITextField().then {
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.layer.cornerRadius = 23
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.white.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.textColor = .white
        $0.attributedPlaceholder = NSAttributedString(string: "3~20자로 닉네임을 입력해주세요.", attributes: attributes)
    }
    
    internal lazy var seconedTextFieldLable = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18.0, weight: .semibold)
        $0.text = "이메일"
    }
    
    internal lazy var seconedTextField = UITextField().then {
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.layer.cornerRadius = 23
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.white.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.textColor = .white
        $0.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요.", attributes: attributes)
    }
    
//    internal lazy var passwordTextFieldLable = UILabel().then {
//        $0.textColor = .white
//        $0.font = .systemFont(ofSize: 18.0, weight: .semibold)
//        $0.text = "비밀번호"
//    }
    
//    internal lazy var passwordTextField = UITextField().then {
//        $0.borderStyle = UITextField.BorderStyle.none
//        $0.returnKeyType = UIReturnKeyType.done
//        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        $0.layer.cornerRadius = 23
//        $0.layer.borderWidth = 1.0
//        $0.layer.borderColor = UIColor.white.cgColor
//        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
//        $0.leftViewMode = .always
//        $0.textColor = .white
//        $0.attributedPlaceholder = NSAttributedString(string: "숫자,대소문자,특수문자 포함 4~30자", attributes: attributes)
//    }
    
    internal lazy var signupButton = UIButton().then {
        let image = UIImage(named: "SignupButton")
        $0.setBackgroundImage(image, for: UIControl.State.normal)
        $0.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: {
                print("🫧SignButton")
            })
            .disposed(by: disposeBag)
    }
}

extension MainSignupViewController {
    func setupLayout() {
        [
            firstText,
            seconedText,
            
            firstTextFieldLable,
            firstTextField,
            
            seconedTextFieldLable,
            seconedTextField,
            
//            passwordTextFieldLable,
//            passwordTextField,
            
            signupButton
        ].forEach { view.addSubview($0)}
        
        firstText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80.0)
            $0.leading.equalToSuperview().inset(44.0)
        }
        
        seconedText.snp.makeConstraints {
            $0.top.equalTo(firstText.snp.bottom).offset(10.0)
            $0.leading.equalTo(firstText.snp.leading)
        }
        
        firstTextFieldLable.snp.makeConstraints {
            $0.top.equalTo(seconedText.snp.bottom).offset(152.0)
            $0.leading.equalTo(seconedText.snp.leading)
        }
        
        firstTextField.snp.makeConstraints {
            $0.top.equalTo(firstTextFieldLable.snp.bottom).offset(13.0)
            $0.centerX.equalTo(view)
            $0.height.equalTo(50.0)
            $0.width.equalTo(390.0)
        }
        
        seconedTextFieldLable.snp.makeConstraints {
            $0.top.equalTo(firstTextField.snp.bottom).offset(40.0)
            $0.leading.equalTo(seconedText.snp.leading)
        }
        
        seconedTextField.snp.makeConstraints {
            $0.top.equalTo(seconedTextFieldLable.snp.bottom).offset(13.0)
            $0.centerX.equalTo(view)
            $0.height.equalTo(50.0)
            $0.width.equalTo(390.0)
        }
        
//        passwordTextFieldLable.snp.makeConstraints {
//            $0.top.equalTo(seconedTextField.snp.bottom).offset(40.0)
//            $0.leading.equalTo(seconedText.snp.leading)
//        }
//
//        passwordTextField.snp.makeConstraints {
//            $0.top.equalTo(passwordTextFieldLable.snp.bottom).offset(13.0)
//            $0.centerX.equalTo(view)
//            $0.height.equalTo(50.0)
//            $0.width.equalTo(390.0)
//        }
        
        signupButton.snp.makeConstraints {
            $0.top.equalTo(seconedTextField.snp.bottom).offset(228.0)
            $0.centerX.equalTo(view)
            $0.height.equalTo(50.0)
            $0.width.equalTo(390.0)
        }
    }
}
