//
//  AdvertisementView.swift
//  RGB
//
//  Created by 박준하 on 2022/11/13.
//

import UIKit
import RxSwift
import SnapKit
import Then

class AdvertismentView: UIView {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
//        let userGraphListSectionView = UserGraphListSectionView(frame: .zero, viewController: self)
//        let suggestionCoinSectionView = SuggestionCoinSectionView(frame: .zero, viewController: self)
//        let grassSectionView = GrassSectionView(frame: .zero, viewController: self)
        
        let AdvertisementView
        
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
}
