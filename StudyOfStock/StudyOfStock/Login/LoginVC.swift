//
//  testVC.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/09/23.
//

import UIKit
import SnapKit
import RxSwift
import RxKeyboard

class LoginViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    private lazy var emailTextLabel = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.text = "이메일"
    }
    
    private lazy var passwordTextLabel = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.text = "비밀번호"
    }
    
    private lazy var haveId = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 16.0, weight: .light)
        $0.text = "아직 회원이 아니신가요?"
    }
    
    private lazy var gmailTextField = UITextField().then {
        $0.placeholder = "이메일을 입력해주세요"
//        textField.delegate = self
        $0.borderStyle = UITextField.BorderStyle.none
        $0.keyboardType = UIKeyboardType.emailAddress
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.rx.text
            .subscribe { gmailText in
                print("📭 LoginGamil : \(gmailText)")
            }
            .disposed(by: disposeBag)
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요"
        $0.borderStyle = UITextField.BorderStyle.none
        $0.keyboardType = UIKeyboardType.emailAddress
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.rx.text
            .subscribe { passwordText in
                print("🔐 passwordGamil : \(passwordText)")
            }
            .disposed(by: disposeBag)
    }
    
    private lazy var emailTextFieldBg = UIView().then {
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 25 * view.frame.height / 932
    }
    
    private lazy var passwordTextFieldBg = UIView().then {
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 25
    }
    
    private lazy var gotoSignUpButton = UIButton().then {
        let image = UIImage(named: "SignupTextImage")
        $0.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        $0.setBackgroundImage(image, for: UIControl.State.normal)
        $0.addTarget(self, action:#selector(goToSignupTapped), for: .touchUpInside)
    }
    
    private lazy var mainLoginButton = UIButton().then {
        let image = UIImage(named: "LoginButton")
        $0.frame = CGRect(x: 10, y: 100, width: 100 * view.frame.width / 430, height: 100 * view.frame.height / 932)
        $0.setBackgroundImage(image, for: UIControl.State.normal)
        $0.addTarget(self, action:#selector(loginTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        if let sheetPresentationController = sheetPresentationController {
            let height = view.frame.height
            sheetPresentationController.largestUndimmedDetentIdentifier = .large
            let id = UISheetPresentationController.Detent.Identifier("LoginCustom")
            let customDetent = UISheetPresentationController.Detent.custom(identifier: id) { context in
                return 540 * height / 932
            }
            sheetPresentationController.detents = [customDetent]
        }
        self.isModalInPresentation = true
        view.backgroundColor = .white
        setupLayout()
        print("LoginViewController")
    }
}

extension LoginViewController {
    func setupLayout() {
        [
            emailTextLabel,
            emailTextFieldBg,
            gmailTextField,
            
            passwordTextLabel,
            passwordTextFieldBg,
            passwordTextField,
            
            haveId,
            gotoSignUpButton,
            
            mainLoginButton
            
        ].forEach {
            view.addSubview($0)
        }
        
        let width = view.frame.width / 430.0
        let height = view.frame.height / 932.0
        
        emailTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80 * height)
            $0.leading.equalToSuperview().offset(50 * width)
        }
        
        emailTextFieldBg.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(10 * height)
            $0.leading.equalTo(emailTextLabel.snp.leading).offset(-10 * width)
            $0.width.equalTo(350 * width)
            $0.height.equalTo(55 * height)
        }
        
        gmailTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(10 * height)
            $0.leading.equalTo(emailTextLabel.snp.leading).offset(10 * width)
            $0.width.equalTo(emailTextFieldBg.snp.width).inset(20 * width)
            $0.height.equalTo(emailTextFieldBg.snp.height)
        }
        
        passwordTextLabel.snp.makeConstraints {
            $0.top.equalTo(gmailTextField.snp.bottom).offset(40 * height)
            $0.leading.equalTo(emailTextLabel.snp.leading)
        }
        
        passwordTextFieldBg.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(10 * height)
            $0.leading.equalTo(passwordTextLabel.snp.leading).offset(-10 * width)
            $0.width.equalTo(350 * width)
            $0.height.equalTo(55 * height)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(10 * height)
            $0.leading.equalTo(passwordTextLabel.snp.leading).offset(10 * width)
            $0.width.equalTo(passwordTextFieldBg.snp.width).inset(20 * width)
            $0.height.equalTo(passwordTextFieldBg.snp.height)
        }
        
        haveId.snp.makeConstraints {
            $0.top.equalTo(passwordTextFieldBg.snp.bottom).offset(50 * height)
            $0.leading.equalTo(passwordTextLabel.snp.leading).inset(40 * width)
        }
        
        gotoSignUpButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextFieldBg.snp.bottom).offset(53 * height)
            $0.leading.equalTo(passwordTextLabel.snp.leading).inset(210 * width)
            $0.height.equalTo(15 * height)
            $0.width.equalTo(65 * width)
        }
        
        mainLoginButton.snp.makeConstraints {
            $0.top.equalTo(gotoSignUpButton.snp.bottom).offset(40 * height)
            $0.leading.equalTo(passwordTextFieldBg.snp.leading).offset(-10 * width)
            $0.height.equalTo(60 * height)
            $0.width.equalTo(360 * width)
        }
    }
    
    @objc func goToSignupTapped(_ sender: UIButton!)
    {
        print("회원가입 드가자🥹")
    }
    
    @objc func loginTapped(_ sender: UIButton!)
    {
        print("로그인 드가자🥹")
    }
}

