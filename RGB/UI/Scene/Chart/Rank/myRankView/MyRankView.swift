import UIKit

class MyRankView: UIView {
    private final var controller: UIViewController

    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var myRankLabel = UILabel().then {
        $0.text = "내 순위"
        $0.font = .systemFont(ofSize: 16.0, weight: .black)
        $0.textColor = .white
    }
    
    private lazy var myRankView = UIView().then {
        $0.backgroundColor = UIColor(named: "TableViewColor")
        $0.layer.cornerRadius = 20
    }
    
    private lazy var fundsLabel = UILabel().then {
        $0.text = "자금"
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = UIColor(named: "CoustomGray")
    }
    
    private lazy var fundsRanking = UILabel().then {
        $0.text = "132위"
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = .white
    }
    
    private lazy var revenueLabel = UILabel().then {
        $0.text = "수익률"
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = UIColor(named: "CoustomGray")
    }
    
    private lazy var revenueRanking = UILabel().then {
        $0.text = "258위"
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = .white
    }
}

extension MyRankView {
    func layout() {
        [
            myRankLabel,
            myRankView,
            fundsLabel,
            fundsRanking,
            revenueLabel,
            revenueRanking
        ].forEach { self.addSubview($0) }
        
        myRankLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.0)
            $0.leading.equalToSuperview().inset(40.0)
        }
        
        myRankView.snp.makeConstraints {
            $0.top.equalTo(myRankLabel.snp.bottom).offset(12.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50.0)
            $0.width.equalTo(370.0)
        }
        
        fundsLabel.snp.makeConstraints {
            $0.top.equalTo(myRankView.snp.top).offset(17.0)
            $0.leading.equalTo(myRankLabel.snp.leading).inset(20.0)
        }
        
        fundsRanking.snp.makeConstraints {
            $0.top.equalTo(fundsLabel.snp.top)
            $0.leading.equalTo(fundsLabel.snp.trailing).offset(20.0)
        }
        
        revenueLabel.snp.makeConstraints {
            $0.top.equalTo(fundsRanking.snp.top)
            $0.leading.equalTo(fundsRanking.snp.trailing).offset(80.0)
        }
        
        revenueRanking.snp.makeConstraints {
            $0.top.equalTo(revenueLabel.snp.top)
            $0.leading.equalTo(revenueLabel.snp.trailing).offset(20.0)
        }
    }
}
