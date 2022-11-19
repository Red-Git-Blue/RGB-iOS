import UIKit
import RxSwift
import SnapKit
import Then

class PurchaseAndGiftButtonView: UIView {
    
    private final var controller: UIViewController
    
    private let buttonView = UIView().then {
        $0.backgroundColor = .blue
    }
    
    private lazy var purchaseButton = UIButton().then {
        $0.setTitle("구매하기", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .white), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .red
    }
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PurchaseAndGiftButtonView {
    func setup() {
        [
            buttonView,
            purchaseButton
        ].forEach { self.addSubview($0) }
        
        buttonView.snp.makeConstraints {
          $0.left.right.bottom.equalToSuperview()
          $0.top.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-60)
        }
        
        purchaseButton.snp.makeConstraints {
            $0.top.equalTo(buttonView.snp.bottom).offset(10.0)
            $0.leading.equalToSuperview().inset(30)
        }
    }
}
