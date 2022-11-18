import UIKit
import Then
import SnapKit

class BagesTapView: UIView {
    private final var controller: UIViewController
    
    private lazy var mainBagesImage = UIImageView().then {
        let imageName = "MainBage"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        $0.backgroundColor = .red
    }
    
    private lazy var bagesName = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .bold)
        $0.textColor = .white
        $0.text = "고급스러운 무의 배지"
    }
    
    private lazy var bagesdescriptions = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.text = "고급스러운 색감과 무의 예술적인 감각을 살린 배지이지만,\n준하가 백만 년 동안 정성스럽게 키웠다."
    }
    
    private lazy var coinPriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .white
        $0.text = "12,000원"
    }
    
    private lazy var separator = UIView().then {
        $0.backgroundColor = .separator
    }
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        setup()
        
        mainBagesImage.layer.cornerRadius = 20
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BagesTapView {
    func setup() {
        [
            mainBagesImage,
            bagesName,
            bagesdescriptions,
            coinPriceLabel,
            separator
        ].forEach { self.addSubview($0) }
        
        mainBagesImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(370)
            $0.width.equalTo(370)
        }
        
        bagesName.snp.makeConstraints {
            $0.top.equalTo(mainBagesImage.snp.bottom).offset(40.0)
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        bagesdescriptions.snp.makeConstraints {
            $0.top.equalTo(bagesName.snp.bottom).offset(20.0)
            $0.leading.equalTo(bagesName.snp.leading)
        }
        
        coinPriceLabel.snp.makeConstraints {
            $0.top.equalTo(bagesdescriptions.snp.bottom).offset(20.0)
            $0.leading.equalTo(bagesdescriptions.snp.leading)
        }
        
        separator.snp.makeConstraints {
            $0.top.equalTo(coinPriceLabel.snp.bottom).offset(30.0)
            $0.height.equalTo(1)
            $0.width.equalTo(370)
            $0.centerX.equalToSuperview()
        }
    }
}
