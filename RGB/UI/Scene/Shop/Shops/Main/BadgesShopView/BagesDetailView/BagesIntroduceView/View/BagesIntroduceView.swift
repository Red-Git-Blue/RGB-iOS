import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa
import RxRelay
import Kingfisher

class BagesIntroduceView: UIView {
    private final var controller: UIViewController
    private let viewReceive = PublishRelay<Void>()
    let disposeBag = DisposeBag()
    let id: Int
    
    var bageDetailList: BagesListModel?
    
    private lazy var mainBadgesImage = UIImageView().then { _ in
        let imageName = "MainBage"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
    }
    
    private lazy var badgesName = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .bold)
        $0.textColor = .white
        $0.text = "고급스러운 무의 배지"
    }
    
    private lazy var badgesDescriptions = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.text = "고급스러운 색감과 무의 예술적인 감각을 살린 배지이지만,\n준하가 백만 년 동안 정성스럽게 키웠다."
        $0.lineBreakMode = .byCharWrapping
    }
    
    private lazy var coinPriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .white
        $0.text = "12,000원"
    }
    
    private lazy var separator = UIView().then {
        $0.backgroundColor = .separator
    }
    
    init(frame: CGRect, viewController: UIViewController, id: Int) {
        controller = viewController
        self.id = id
        super.init(frame: frame)
        setup()
        
        mainBadgesImage.layer.cornerRadius = 20
        
        bind(BadgesDetailViewModel())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BagesIntroduceView {
    func setup() {
        [
            mainBadgesImage,
            badgesName,
            badgesDescriptions,
            coinPriceLabel,
            separator
        ].forEach { self.addSubview($0) }
        
        mainBadgesImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(370)
            $0.width.equalTo(370)
        }
        
        badgesName.snp.makeConstraints {
            $0.top.equalTo(mainBadgesImage.snp.bottom).offset(40.0)
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        badgesDescriptions.snp.makeConstraints {
            $0.top.equalTo(badgesName.snp.bottom).offset(20.0)
            $0.leading.equalTo(badgesName.snp.leading)
        }
        
        coinPriceLabel.snp.makeConstraints {
            $0.top.equalTo(badgesDescriptions.snp.bottom).offset(20.0)
            $0.leading.equalTo(badgesDescriptions.snp.leading)
        }
        
        separator.snp.makeConstraints {
            $0.top.equalTo(coinPriceLabel.snp.bottom).offset(30.0)
            $0.height.equalTo(1)
            $0.width.equalTo(370)
            $0.centerX.equalToSuperview()
        }
    }
    
    func bind(_ viewModel: BadgesDetailViewModel) {
        let input = BadgesDetailViewModel.Input(viewReceive: viewReceive.asDriver(onErrorJustReturn: ()), id: self.id)
        
        let output = viewModel.trans(input)
        print(input)
        print("bind를 거치긴 함")
        
        output.badgeDetailData.subscribe(onNext: { data in
            self.badgesName.text = "\(data.name)"
            self.badgesDescriptions.text = "\(data.introduction)"
            self.badgesDescriptions.lineBreakMode = .byCharWrapping
            self.coinPriceLabel.text = "\(data.price.toDigitString())원"
            
            self.mainBadgesImage.kf.setImage(with: URL(string: data.mainImage.fileURL), placeholder: #imageLiteral(resourceName: "RGBLogo"))
            
            print("구독은 됐음")
        }).disposed(by: disposeBag)
    }
}
