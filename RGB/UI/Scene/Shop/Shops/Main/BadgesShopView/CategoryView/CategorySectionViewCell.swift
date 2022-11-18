//
//  CategorySectionViewCell.swift
//  RGB
//
//  Created by 박준하 on 2022/11/14.
//

import SnapKit
import Then
import UIKit

final class CategorySectionViewCell: UICollectionViewCell {
    static var height: CGFloat { 100.0 }
    static var width: CGFloat { 100.0 }

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.borderColor = UIColor.tertiaryLabel.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 7.0

        return imageView
    }()
    
    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .label
        $0.numberOfLines = 2
        $0.text = "ㅌㅌㅌㅌ"
    }

//    func setup(rankingFeature: RankingFeature) {
//        setupLayout()
//
//        titleLabel.text = rankingFeature.title
//        descriptionLabel.text = rankingFeature.description
//        inAppPurchaseInfoLabel.isHidden = !rankingFeature.isInPurchaseApp
//    }

}

// MARK: Private
private extension CategorySectionViewCell {
    func setupLayout() {
        [
            imageView,
            titleLabel
        ].forEach { addSubview($0) }

        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(4.0)
            $0.bottom.equalToSuperview().inset(4.0)
            $0.width.equalTo(imageView.snp.height)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageView.snp.top).inset(5.0)
        }
    }
}
