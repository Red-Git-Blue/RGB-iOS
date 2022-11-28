import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit
import Charts

class BaseSignView {
    
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5),
                      .font : UIFont.systemFont(ofSize: 14, weight: .bold)]
    
    var disposeBag = DisposeBag()
    
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
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 24.0, height: 0.0))
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
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 24.0, height: 0.0))
        $0.leftViewMode = .always
        $0.textColor = .white
        $0.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요.", attributes: attributes)
    }
    
    internal lazy var mainButton = UIButton().then {
        let image = UIImage(named: "SignupButton")
        $0.setBackgroundImage(image, for: UIControl.State.normal)
    }
    
    func updateWith(_ controller: UIViewController) {
        [
            firstText,
            seconedText,
            
            firstTextFieldLable,
            firstTextField,
            
            seconedTextFieldLable,
            seconedTextField,
            
            mainButton
        ].forEach { controller.view.addSubview($0)}
        
        let width = controller.view.frame.width / 430.0
        let height = controller.view.frame.height / 932.0
        
        firstText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80.0 * height)
            $0.leading.equalToSuperview().inset(44.0 * width)
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
            $0.centerX.equalTo(controller.view)
            $0.height.equalTo(50.0 * height)
            $0.width.equalTo(390.0 * width)
        }
        
        seconedTextFieldLable.snp.makeConstraints {
            $0.top.equalTo(firstTextField.snp.bottom).offset(40.0)
            $0.leading.equalTo(seconedText.snp.leading)
        }
        
        seconedTextField.snp.makeConstraints {
            $0.top.equalTo(seconedTextFieldLable.snp.bottom).offset(13.0)
            $0.centerX.equalTo(controller.view)
            $0.height.equalTo(50.0 * height)
            $0.width.equalTo(390.0 * width)
        }
        
        mainButton.snp.makeConstraints {
            $0.top.equalTo(seconedTextField.snp.bottom).offset(228.0)
            $0.centerX.equalTo(controller.view)
            $0.height.equalTo(50.0 * height)
            $0.width.equalTo(390.0 * width)
        }
    }
}
