//
//  SignupView.swift
//  RGB
//
//  Created by 박준하 on 2022/10/25.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa
import Then
import SnapKit

class SignupView: BaseSignView {
    
    internal lazy var passwordTextField = UITextField().then {
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.layer.cornerRadius = 23
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.white.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 24.0, height: 0.0))
        $0.leftViewMode = .always
        $0.textColor = .white
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력하세요", attributes: attributes)
    }
    
    private lazy var passwordTextLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18.0, weight: .bold)
        $0.text = "비밀번호"
    }
    
    private lazy var haveId = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 14.0, weight: .light)
        $0.text = "이미 계정을 가지고 계십니까?"
    }
    
    internal lazy var goLoginButton = UIButton().then {
        $0.setTitle("로그인  >", for: .normal)
        $0.setTitleColor(UIColor(named: "errorColor"), for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        [
            passwordTextLabel,
            passwordTextField,
            haveId,
            goLoginButton
        ].forEach { controller.view.addSubview($0) }
        
        passwordTextLabel.snp.makeConstraints {
            $0.top.equalTo(seconedTextField.snp.bottom).offset(40.0)
            $0.leading.equalTo(seconedTextFieldLable.snp.leading)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(10.0)
            $0.centerX.equalTo(controller.view)
            $0.height.equalTo(50.0)
            $0.width.equalTo(390.0)
        }
        
        haveId.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(79.0)
            $0.leading.equalTo(88.0)
        }
        goLoginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(73.0)
            $0.leading.equalTo(haveId.snp.trailing).offset(20.0)
        }
    }
}
