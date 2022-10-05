//
//  SignVC.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/09/28.
//

import UIKit
import SnapKit
import RxSwift
import RxKeyboard

class SignViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    private lazy var nickNameTextLabel = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.text = "닉네임"
    }
    
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
    
    private lazy var nickNameTextField = UITextField().then {
        $0.placeholder = "이름을 입력하세요"
        $0.borderStyle = UITextField.BorderStyle.none
        $0.keyboardType = UIKeyboardType.emailAddress
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.rx.text
            .subscribe { passwordText in
                print("👶 passwordGamil : \(passwordText)")
            }
            .disposed(by: disposeBag)
    }
    
    private lazy var emailTextField = UITextField().then {
        $0.placeholder = "이메일을 입력해주세요"
//        textField.delegate = self
        $0.borderStyle = UITextField.BorderStyle.none
        $0.keyboardType = UIKeyboardType.emailAddress
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.rx.text
            .subscribe { gmailText in
                print("📬 LoginGamil : \(gmailText)")
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
                print("🔓 passwordGamil : \(passwordText)")
            }
            .disposed(by: disposeBag)
    }
    
    private lazy var nickTextFieldBg = UIView().then {
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 25
    }
    
    private lazy var emailTextFieldBg = UIView().then {
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 25
    }
    
    private lazy var passwordTextFieldBg = UIView().then {
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 25
    }
    
    private lazy var gotoSignUpButton = UIButton().then {
        let image = UIImage(named: "LoginTextImage")
        $0.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        $0.setBackgroundImage(image, for: UIControl.State.normal)
        $0.addTarget(self, action:#selector(goToLoginTapped), for: .touchUpInside)
    }
    
    private lazy var mainLoginButton = UIButton().then {
        let image = UIImage(named: "SignButton")
        $0.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        $0.setBackgroundImage(image, for: UIControl.State.normal)
        $0.addTarget(self, action:#selector(SignTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.largestUndimmedDetentIdentifier = .large
            let id = UISheetPresentationController.Detent.Identifier("SignCustom")
            let SignCustomDetent = UISheetPresentationController.Detent.custom(identifier: id) { context in
                return 540
            }
            sheetPresentationController.detents = [SignCustomDetent]
        }
        self.isModalInPresentation = true
        view.backgroundColor = .white
        setupLayout()
        print("SignViewController")
    }
}

extension SignViewController {
    func setupLayout() {
        [
            emailTextLabel,
            emailTextFieldBg,
            emailTextField,
            
            passwordTextLabel,
            passwordTextFieldBg,
            passwordTextField,
            
            nickNameTextLabel,
            nickTextFieldBg,
            nickNameTextField,
            
            haveId,
            gotoSignUpButton,

            mainLoginButton
            
        ].forEach { view.addSubview($0) }
        
        nickNameTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(50)
        }
        
        nickTextFieldBg.snp.makeConstraints {
            $0.top.equalTo(nickNameTextLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(350)
            $0.height.equalTo(55)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(nickNameTextLabel.snp.bottom).offset(10)
            $0.leading.equalTo(nickNameTextLabel.snp.leading).offset(10)
            $0.width.equalTo(nickTextFieldBg.snp.width).inset(20)
            $0.height.equalTo(nickTextFieldBg.snp.height)
        }
        
        emailTextLabel.snp.makeConstraints {
            $0.top.equalTo(nickNameTextField.snp.bottom).offset(20)
            $0.leading.equalTo(nickNameTextLabel.snp.leading)
        }
        
        emailTextFieldBg.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(10)
            $0.centerX.equalTo(nickTextFieldBg.snp.centerX)
            $0.width.equalTo(350)
            $0.height.equalTo(55)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(10)
            $0.leading.equalTo(emailTextLabel.snp.leading).offset(10)
            $0.width.equalTo(emailTextFieldBg.snp.width).inset(20)
            $0.height.equalTo(emailTextFieldBg.snp.height)
        }
        
        passwordTextLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.leading.equalTo(emailTextLabel.snp.leading)
        }
        
        passwordTextFieldBg.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(10)
            $0.centerX.equalTo(emailTextFieldBg.snp.centerX)
            $0.width.equalTo(emailTextFieldBg.snp.width)
            $0.height.equalTo(emailTextFieldBg.snp.height)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(10)
            $0.leading.equalTo(passwordTextLabel.snp.leading).offset(10)
            $0.width.equalTo(passwordTextFieldBg.snp.width).inset(20)
            $0.height.equalTo(passwordTextFieldBg.snp.height)
        }
        
        haveId.snp.makeConstraints {
            $0.top.equalTo(passwordTextFieldBg.snp.bottom).offset(50)
            $0.leading.equalTo(passwordTextLabel.snp.leading).inset(40)
        }

        gotoSignUpButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextFieldBg.snp.bottom).offset(51)
            $0.leading.equalTo(nickNameTextLabel.snp.leading).inset(210)
            $0.height.equalTo(18)
            $0.width.equalTo(60)
        }

        mainLoginButton.snp.makeConstraints {
            $0.top.equalTo(gotoSignUpButton.snp.bottom).offset(40)
            $0.leading.equalTo(passwordTextFieldBg.snp.leading).offset(-10)
            $0.height.equalTo(70)
            $0.width.equalTo(360)
        }
    }
    
    @objc func goToLoginTapped(_ sender: UIButton!)
    {
        print("🫶로그인 드가자")
    }
    
    @objc func SignTapped(_ sender: UIButton!)
    {
        print("닉네임: \(nickNameTextField.text!)")
        print("이메일: \(emailTextField.text!)")
        print("비밀번호: \(passwordTextField.text!)")
        print("🌈 회원가입 드가자")
    }
}

