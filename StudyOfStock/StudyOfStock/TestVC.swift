//
//  testVC.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/09/23.
//

import UIKit
import SnapKit

class TestViewContoller: UIViewController {
    
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
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "비밀번호를 입력하세요"
        textField.borderStyle = UITextField.BorderStyle.none
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return textField
    }()
    
    private lazy var systemTextView1: UIView = {
        var view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 30
        
        return view
    }()
    
    private lazy var systemTextView2: UIView = {
        var view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 30
        
        return view
    }()
    
    private lazy var gotoSignUpButton: UIButton = {
        let image = UIImage(named: "SignupTextImage")
        
        let button = UIButton()
        button.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        button.setBackgroundImage(image, for: UIControl.State.normal)
        button.addTarget(self, action:#selector(self.imageButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.largestUndimmedDetentIdentifier = .large
            let id = UISheetPresentationController.Detent.Identifier("custom")
            let customDetent = UISheetPresentationController.Detent.custom(identifier: id) { context in
                return 540
            }
            sheetPresentationController.detents = [customDetent, .large()]
        }
        view.backgroundColor = .white
        setupLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("뷰가 없어졌어요")
    }
}

extension TestViewContoller {
    func setupLayout() {
        [
            emailTextLabel,
            systemTextView1,
            gmailTextField,
            
            passwordTextLabel,
            systemTextView2,
            passwordTextField,
            
            haveId,
            gotoSignUpButton
            
        ].forEach { view.addSubview($0) }
        
        emailTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(110)
            $0.leading.equalToSuperview().offset(50)
        }
        
        systemTextView1.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(10)
            $0.leading.equalTo(emailTextLabel.snp.leading).offset(-10)
            $0.width.equalTo(350)
            $0.height.equalTo(60)
        }
        
        gmailTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(10)
            $0.leading.equalTo(emailTextLabel.snp.leading).offset(10)
            $0.width.equalTo(systemTextView1.snp.width).inset(20)
            $0.height.equalTo(systemTextView1.snp.height)
        }
        
        passwordTextLabel.snp.makeConstraints {
            $0.top.equalTo(gmailTextField.snp.bottom).offset(40)
            $0.leading.equalTo(emailTextLabel.snp.leading)
        }
        
        systemTextView2.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(10)
            $0.leading.equalTo(passwordTextLabel.snp.leading).offset(-10)
            $0.width.equalTo(350)
            $0.height.equalTo(60)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(10)
            $0.leading.equalTo(passwordTextLabel.snp.leading).offset(10)
            $0.width.equalTo(systemTextView2.snp.width).inset(20)
            $0.height.equalTo(systemTextView2.snp.height)
        }
        
        haveId.snp.makeConstraints {
            $0.top.equalTo(systemTextView2.snp.bottom).offset(50)
            $0.leading.equalTo(passwordTextLabel.snp.leading).inset(20)
        }
        
        gotoSignUpButton.snp.makeConstraints {
            $0.top.equalTo(systemTextView2.snp.bottom).offset(53)
            $0.leading.equalTo(passwordTextLabel.snp.leading).inset(190)
            $0.height.equalTo(15)
            $0.width.equalTo(60)
        }
    }
    
    @objc func imageButtonTapped(_ sender:UIButton!)
    {
        print("회원가입 드가자🥹")
    }
}


