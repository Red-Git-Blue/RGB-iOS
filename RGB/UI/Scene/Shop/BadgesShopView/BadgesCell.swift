//
//  BadgesCell.swift
//  RGB
//
//  Created by 박준하 on 2022/11/14.
//
import SnapKit
import Then
import UIKit

final class BadgesCell: UICollectionViewCell {
    static var height: CGFloat { 310.0 }
    static var width: CGFloat { 220.0 }

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(named: "CollectionViewColor")
        imageView.layer.cornerRadius = 20.0

        return imageView
    }()
    
    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .white
        $0.text = "고급스러운 무의 배지"
    }
    
    private lazy var descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.text = "고급스러운 색감과 무의 예술적인 \n감각을 살린 배지"
    }

    private lazy var coinPriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .white
        $0.text = "12,000원"
    }

    func setup() {
        setupLayout()
    }
}

// MARK: Private
private extension BadgesCell {
    func setupLayout() {
        [
            imageView,
            titleLabel,
            descriptionLabel,
            coinPriceLabel
        ].forEach { addSubview($0) }

        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(220.0)
            $0.width.equalTo(220.0)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(15.0)
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(3.0)
        }
        coinPriceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
