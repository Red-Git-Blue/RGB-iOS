import SnapKit
import Then
import UIKit

final class UserViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let userGraphListSectionView = UserGraphListSectionView(frame: .zero, viewController: self)
        let suggestionCoinSectionView = SuggestionCoinSectionView(frame: .zero, viewController: self)
        let grassSectionView = GrassSectionView(frame: .zero, viewController: self)
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(100.0)
        }
        
        [
            userGraphListSectionView,
            suggestionCoinSectionView,
            grassSectionView,
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

private extension UserViewController {
    func setupNavigationController() {

        let bar: UINavigationBar! = self.navigationController?.navigationBar

        bar.backgroundColor = .clear
        bar.setBackgroundImage(UIImage(), for: .default)
        bar.shadowImage = UIImage()
        bar.isTranslucent = true
        let bellNavigetionItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: nil, action: nil)
        let setNavigetionItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: nil, action: nil)

        navigationItem.rightBarButtonItems = [setNavigetionItem, bellNavigetionItem]
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
