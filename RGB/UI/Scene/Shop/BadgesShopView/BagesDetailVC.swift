//
//  BagesDetailView.swift
//  RGB
//
//  Created by 박준하 on 2022/11/14.
//

import UIKit
import Then
import SnapKit
import RxSwift
import Kingfisher

class BagesDetailViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let bagesTapSectionView = BagesTapView(frame: .zero, viewController: self)
        
        let newBagesSectionView = NewBadgesView(frame: .zero, viewController: self)
        
        let lastTextView = LastTextView(frame: .zero, viewController: self)
        
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(640.0)
        }
        
        let lastSpacingView = UIView()
        lastSpacingView.snp.makeConstraints {
            $0.height.equalTo(200)
        }
        
        [
            bagesTapSectionView,
            spacingView,
            newBagesSectionView,
            lastTextView,
            lastSpacingView
            
        ].forEach {
            stackView.addArrangedSubview($0)
        }
        
    }
    
    var bageList: BagesListModel?
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}
private extension BagesDetailViewController {

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
