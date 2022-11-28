import UIKit

class GrassGatchaViewController: BaseAbstractShop {
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let advertisementSectionView = AdvertisementSectionView(frame: .zero, viewController: self)
        
        let grassGatchaView = GrassGatchaView(frame: .zero, viewController: self)
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(60.0)
        }
        
        let spacingView2 = UIView()
        spacingView2.snp.makeConstraints {
            $0.height.equalTo(60.0)
        }
        
        [
            advertisementSectionView,
            spacingView,
            grassGatchaView,
            spacingView2
        ].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        print("안녕")
        setupLayout()
    }
    
    override func viewIndex() -> Int {
        return 3
    }
}

extension GrassGatchaViewController {
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
