import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit
import Charts

class BaseCompletionView {
    
    var disposeBag = DisposeBag()
    
    internal lazy var firstLargeLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 40.0, weight: .bold)
        $0.text = "이메일 인증이\n발송되었습니다."
        $0.numberOfLines = 2
    }
    
    internal lazy var secondRegularLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18.0 , weight: .regular)
        $0.text = "이메일이 오지 않으셨나요?"
    }
    
    internal lazy var sendButton = UIButton().then {
        $0.setTitle("인증메일 보내기  >", for: .normal)
        $0.setTitleColor(UIColor(named: "errorColor"), for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    func updateWith(_ controller: UIViewController) {
        
        [
            firstLargeLabel,
            secondRegularLabel,
            sendButton
        ].forEach { controller.view.addSubview($0)}
        
        firstLargeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80.0)
            $0.leading.equalToSuperview().inset(44.0)
        }
        
        secondRegularLabel.snp.makeConstraints {
            $0.top.equalTo(firstLargeLabel.snp.bottom).offset(52.0)
            $0.leading.equalTo(firstLargeLabel.snp.leading)
        }
        
        sendButton.snp.makeConstraints {
            $0.top.equalTo(secondRegularLabel.snp.bottom).offset(18.0)
            $0.leading.equalTo(secondRegularLabel.snp.leading)
        }
        
        
    }
}
