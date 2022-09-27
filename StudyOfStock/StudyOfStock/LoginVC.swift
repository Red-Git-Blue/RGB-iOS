//
//  testVC.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/09/23.
//

import UIKit
import SnapKit
import RxSwift

class LoginViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    private lazy var emailTextLabel: UILabel = {
        var label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.text = "이메일"
        
        return label
    }()
    
    private lazy var passwordTextLabel: UILabel = {
        var label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.text = "비밀번호"
        
        return label
    }()
    
    private lazy var haveId: UILabel = {
        var label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16.0, weight: .light)
        label.text = "아직 회원이 아니신가요?"
        
        return label
    }()
    
    private lazy var gmailTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "이메일을 입력해주세요"
//        textField.delegate = self
        textField.borderStyle = UITextField.BorderStyle.none
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.returnKeyType = UIReturnKeyType.done
        textField.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        textField.rx.text
            .subscribe { gmailText in
                print("📭 LoginGamil : \(gmailText)")
            }
            .disposed(by: disposeBag)
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "비밀번호를 입력하세요"
        textField.borderStyle = UITextField.BorderStyle.none
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.returnKeyType = UIReturnKeyType.done
        textField.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        textField.rx.text
            .subscribe { passwordText in
                print("🔐 passwordGamil : \(passwordText)")
            }
            .disposed(by: disposeBag)
        return textField
    }()
    
    private lazy var emailTextFieldBg: UIView = {
        var view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 25
        
        return view
    }()
    
    private lazy var passwordTextFieldBg: UIView = {
        var view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 25
        
        return view
    }()
    
    private lazy var gotoSignUpButton: UIButton = {
        let image = UIImage(named: "SignupTextImage")
        
        let button = UIButton()
        button.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        button.setBackgroundImage(image, for: UIControl.State.normal)
        button.addTarget(self, action:#selector(goToSignupTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var mainLoginButton: UIButton = {
        let image = UIImage(named: "LoginButton")
        
        let button = UIButton()
        button.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        button.setBackgroundImage(image, for: UIControl.State.normal)
        button.addTarget(self, action:#selector(loginTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.largestUndimmedDetentIdentifier = .large
            let id = UISheetPresentationController.Detent.Identifier("custom")
            let customDetent = UISheetPresentationController.Detent.custom(identifier: id) { context in
                return 540
            }
            sheetPresentationController.detents = [customDetent]
        }
        self.isModalInPresentation = true
        view.backgroundColor = .white
        setupLayout()
        print("TestViewController")
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
            
        ].forEach { view.addSubview($0) }
        
        emailTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.leading.equalToSuperview().offset(50)
        }
        
        emailTextFieldBg.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(10)
            $0.leading.equalTo(emailTextLabel.snp.leading).offset(-10)
            $0.width.equalTo(350)
            $0.height.equalTo(55)
        }
        
        gmailTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(10)
            $0.leading.equalTo(emailTextLabel.snp.leading).offset(10)
            $0.width.equalTo(emailTextFieldBg.snp.width).inset(20)
            $0.height.equalTo(emailTextFieldBg.snp.height)
        }
        
        passwordTextLabel.snp.makeConstraints {
            $0.top.equalTo(gmailTextField.snp.bottom).offset(40)
            $0.leading.equalTo(emailTextLabel.snp.leading)
        }
        
        passwordTextFieldBg.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(10)
            $0.leading.equalTo(passwordTextLabel.snp.leading).offset(-10)
            $0.width.equalTo(350)
            $0.height.equalTo(55)
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
            $0.top.equalTo(passwordTextFieldBg.snp.bottom).offset(53)
            $0.leading.equalTo(passwordTextLabel.snp.leading).inset(210)
            $0.height.equalTo(15)
            $0.width.equalTo(65)
        }
        
        mainLoginButton.snp.makeConstraints {
            $0.top.equalTo(gotoSignUpButton.snp.bottom).offset(40)
            $0.leading.equalTo(passwordTextFieldBg.snp.leading).offset(-10)
            $0.height.equalTo(60)
            $0.width.equalTo(360)
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

