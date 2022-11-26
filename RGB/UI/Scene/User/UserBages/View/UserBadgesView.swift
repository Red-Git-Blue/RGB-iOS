import UIKit

class UserBadgesView: UIView {
    private final var controller: UIViewController

    private lazy var badgesLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.text = "배지"
        $0.textColor = .white
    }

    private lazy var badgesCountLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.text = "(12 / 53)"
        $0.textColor = .gray
    }

    private lazy var showAllAppsButton = UIButton().then {
        $0.setTitle("전체 보기 >", for: .normal)
        $0.setTitleColor(UIColor(named: "errorColor"), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .bold)
    }
    
    private lazy var badgesCollectionView = UIView().then {
        $0.backgroundColor = .red
    }
    
    private lazy var separator = UIView().then {
        $0.backgroundColor = .separator
    }

    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        attribute()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension UserBadgesView {
    
    func bind(_ viewModel: UserBadgesViewModel) {
        
    }
    
    func attribute() {
        badgesCollectionView.layer.cornerRadius = 20
    }
    
    func layout() {
        [
            badgesLabel,
            badgesCountLabel,
            showAllAppsButton,
            badgesCollectionView,
            separator
        ].forEach {
            self.addSubview($0)
        }

        badgesLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(30.0)
        }

        badgesCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(badgesLabel.snp.trailing)
        }

        showAllAppsButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30.0)
        }
        
        badgesCollectionView.snp.makeConstraints {
            $0.top.equalTo(badgesLabel.snp.bottom).offset(10.0)
            $0.leading.equalToSuperview().inset(30.0)
            $0.height.equalTo(237.0)
            $0.width.equalTo(370.0)
        }
        
        separator.snp.makeConstraints {
            $0.top.equalTo(badgesCollectionView.snp.bottom).offset(30.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1.0)
            $0.width.equalTo(370.0)
        }
    }
}
