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
        
        let userInformationView = UserInformationView(frame: .zero, viewController: self)
        
        let userChartView = UserChartView(frame: .zero, viewController: self)
        
        let userBagesView = UserBadgesView(frame: .zero, viewController: self)
        
        let userGrassColorView = UserGrassColorView(frame: .zero, viewController: self)
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(210.0)
        }
        
        let spacingMiddleView = UIView()
        spacingMiddleView.snp.makeConstraints {
            $0.height.equalTo(210.0)
        }
        
        let lastSpacingView = UIView()
        lastSpacingView.snp.makeConstraints {
            $0.height.equalTo(320.0)
        }
        
        let lastView = UIView()
        lastView.snp.makeConstraints {
            $0.height.equalTo(400.0)
        }
        
        [
            userInformationView,
            spacingView,
            userChartView,
            spacingMiddleView,
            userBagesView,
            lastSpacingView,
            userGrassColorView,
            lastView
        ].forEach {
            stackView.addArrangedSubview($0)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
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

        [bellNavigetionItem, setNavigetionItem].forEach { $0.tintColor = .white }

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
