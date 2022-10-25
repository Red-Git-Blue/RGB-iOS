//
//  PasswordView.swift
//  RGB
//
//  Created by 박준하 on 2022/10/25.
//

import UIKit
import Then
import SnapKit

class PasswordView: BaseSignView {
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        let image = UIImage(named: "PasswordChangeButton")
        mainButton.setBackgroundImage(image, for: UIControl.State.normal)
        firstText.text = "비밀번호 변경"
        seconedText.text = "이메일 인증으로 비밀번호를 변경하세요."
        firstTextFieldLable.text = "이메일"
        seconedTextFieldLable.text = "인증번호"
        
        firstTextField.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요.", attributes: attributes)
        seconedTextField.attributedPlaceholder = NSAttributedString(string: "메일에서 받은 인증번호를 입력해주세요.", attributes: attributes)
        seconedTextField.textContentType = .password
        seconedTextField.isSecureTextEntry = true
    }
}
