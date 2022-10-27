import SnapKit
import Then
import UIKit

final class AppViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let userGraphListSectionView = UserGraphListSectionView(frame: .zero)
        let suggestionCoinSectionView = SuggestionCoinSectionView(frame: .zero)
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(100.0)
        }
        
        [
            userGraphListSectionView,
            suggestionCoinSectionView,
            spacingView
        ].forEach {
            stackView.addArrangedSubview($0)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
        setupLayout()
    }
}

private extension AppViewController {
    func setupNavigationController() {
        navigationItem.title = "내 보유 코인"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }

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
