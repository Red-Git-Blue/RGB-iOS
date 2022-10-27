import Then
import UIKit
import SnapKit

class PasswordCompletionView : BaseCompletionView {
    
    internal lazy var PasswordLoginButton = UIButton().then {
        let image = UIImage(named: "LoginButton")
        $0.setBackgroundImage(image, for: UIControl.State.normal)
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        firstLargeLabel.text = "비밀번호를\n찾았습니다."
        secondRegularLabel.text = "당신의 비밀번호는"
        sendButton.setTitle("여기다가 온 email 적어주세요", for: .normal)
        
        [
            PasswordLoginButton
        ].forEach { controller.view.addSubview($0) }
        
        PasswordLoginButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(80.0)
            $0.centerX.equalTo(controller.view)
            $0.height.equalTo(50.0)
            $0.width.equalTo(390.0)
        }
    }
}
