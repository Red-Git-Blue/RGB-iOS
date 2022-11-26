import UIKit

class UserGrassColorView: UIView {
    private final var controller: UIViewController

    private lazy var grassLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.text = "색상"
        $0.textColor = .white
    }

    private lazy var glassCountLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.text = "(6 / 21)"
        $0.textColor = .gray
    }

    private lazy var showAllAppsButton = UIButton().then {
        $0.setTitle("전체 보기 >", for: .normal)
        $0.setTitleColor(UIColor(named: "errorColor"), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .bold)
    }
    
    private lazy var grassColorCollectionView = UIView().then {
        $0.backgroundColor = .red
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

extension UserGrassColorView {
    
    func attribute() {
        grassColorCollectionView.layer.cornerRadius = 20
    }
    
    func layout() {
        [
            grassLabel,
            glassCountLabel,
            showAllAppsButton,
            grassColorCollectionView
        ].forEach {
            self.addSubview($0)
        }

        grassLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(30.0)
        }

        glassCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(grassLabel.snp.trailing)
        }

        showAllAppsButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30.0)
        }
        
        grassColorCollectionView.snp.makeConstraints {
            $0.top.equalTo(grassLabel.snp.bottom).offset(10.0)
            $0.leading.equalToSuperview().inset(30.0)
            $0.height.equalTo(237.0)
            $0.width.equalTo(370.0)
        }
    }
}
