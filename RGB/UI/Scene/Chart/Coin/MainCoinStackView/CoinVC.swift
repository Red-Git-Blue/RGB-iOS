import SnapKit
import Then
import UIKit

final class CoinViewController: BaseAbstractChart {
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let popularCoinSectionView = PopularCoinView(frame: .zero, viewController: self)
        
        let increaseCoinView = IncreaseCoinView(frame: .zero, viewController: self)
        
        let dropCoinViewView = DropCoinView(frame: .zero, viewController: self)
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(440.0)
        }
        
        let minSpacingView = UIView()
        minSpacingView.snp.makeConstraints {
            $0.height.equalTo(440.0)
        }
        
        let lastSpacingView = UIView()
        lastSpacingView.snp.makeConstraints {
            $0.height.equalTo(440.0)
        }
        
        [
            popularCoinSectionView,
            spacingView,
            increaseCoinView,
            minSpacingView,
            dropCoinViewView,
            lastSpacingView
        ].forEach {
            stackView.addArrangedSubview($0)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLayout()
    }
    
    override func viewIndex() -> Int {
        return 0
    }
}

private extension CoinViewController {

    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
