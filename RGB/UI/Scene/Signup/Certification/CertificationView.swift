import UIKit
import SnapKit
import Then

class CertificationView: BaseCompletionView {
    
    internal lazy var futileLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.text = "이메일에서 인증을 완료한 후 서비스를 이용해보세요."
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        [
            futileLabel
        ].forEach { controller.view.addSubview($0) }
        
        futileLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(82.0)
            $0.centerX.equalTo(controller.view)
        }
    }
    
}
