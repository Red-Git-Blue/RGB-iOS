import SnapKit
import Then
import UIKit

final class ShopViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let advertisementSectionView = advertisementView(frame: .zero, viewController: self)
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(100.0)
        }
        
        [
            advertisementSectionView,
            spacingView
        ].forEach {
            stackView.addArrangedSubview($0)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
}

private extension ShopViewController {

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

//extension UIBarButtonItem {
//
//    static func menuButton(_ target: Any?, action: Selector, imageName: String) -> UIBarButtonItem {
//        let button = UIButton(type: .system)
//        button.setImage(UIImage(systemName: "\(imageName)"), for: .normal)
//        button.addTarget(target, action: action, for: .touchUpInside)
//
//        let menuBarItem = UIBarButtonItem(customView: button)
//        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
//        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 4).isActive = true
//        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 4).isActive = true
//
//        return menuBarItem
//    }
//}
