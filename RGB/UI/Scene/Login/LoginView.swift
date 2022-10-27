import UIKit
import Foundation
import RxSwift
import RxCocoa
import Then
import SnapKit

class LoginView: BaseSignView {
    
    internal lazy var areYouUserLable = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.text = "아직 회원이 아니신가요?"
    }
    
    internal lazy var forgetPasswordButton = UIButton().then {
        let image = UIImage(named: "ForgetPassword")
        $0.setBackgroundImage(image, for: UIControl.State.normal)
    }
    
    internal lazy var goSignupButton = UIButton().then {
        $0.setTitle("회원가입  >", for: .normal)
        $0.setTitleColor(UIColor(named: "errorColor"), for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        let image = UIImage(named: "LoginButton")
        mainButton.setBackgroundImage(image, for: UIControl.State.normal)
        firstText.text = "로그인"
        seconedText.text = "로그인 후 서비스를 이용해보세요."
        firstTextFieldLable.text = "닉네임 또는 이메일"
        seconedTextFieldLable.text = "비밀번호"
        
        firstTextField.attributedPlaceholder = NSAttributedString(string: "닉네임 또는 이메일을 입력해주세요.", attributes: attributes)
        seconedTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요.", attributes: attributes)
        seconedTextField.textContentType = .password
        seconedTextField.isSecureTextEntry = true
        
        [
            areYouUserLable,
            forgetPasswordButton,
            goSignupButton
            
        ].forEach { controller.view.addSubview($0) }
    
        areYouUserLable.snp.makeConstraints {
            $0.top.equalTo(seconedTextField.snp.bottom).offset(130.0)
            $0.leading.equalToSuperview().inset(96.0)
        }
        
        forgetPasswordButton.snp.makeConstraints {
            $0.top.equalTo(areYouUserLable.snp.bottom).offset(14.0)
            $0.centerX.equalTo(controller.view)
            $0.height.equalTo(50.0)
            $0.width.equalTo(390.0)
        }
        
        goSignupButton.snp.makeConstraints {
            $0.top.equalTo(seconedTextField.snp.bottom).offset(124.0)
            $0.leading.equalTo(areYouUserLable.snp.trailing).offset(20.0)
        }
    }
}
