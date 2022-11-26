//
//  GiftCollectionViewCell.swift
//  RGB
//
//  Created by 박준하 on 2022/11/26.
//

import UIKit
import SnapKit
import Then

final class GiftCollectionViewCell: UICollectionViewCell {

    private lazy var imageView = UIImageView().then {
        $0.backgroundColor = .red
        $0.layer.borderColor = UIColor.tertiaryLabel.cgColor
        //        옆에 imageview 테두리 만들기
        //        imageView.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 15
    }

    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .label
        $0.numberOfLines = 2
    }

    private lazy var descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .semibold)
        $0.textColor = .secondaryLabel
    }

    func setup() {
        attribute()
        layout()
    }
}

// MARK: Private
private extension GiftCollectionViewCell {
    
    func attribute() {
        titleLabel.text = "JUNHA0211"
        descriptionLabel.text = "12345678"
    }
    
    func layout() {
        [
            imageView,
            titleLabel,
            descriptionLabel
        ].forEach { addSubview($0) }

        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.0)
            $0.top.equalToSuperview().inset(22.0)
            $0.bottom.equalToSuperview().inset(20.0)
            $0.width.equalTo(35.0)
            $0.height.equalTo(35.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(10.0)
//            $0.trailing.equalTo(imageView.snp.leading)
            $0.top.equalTo(imageView.snp.top)
        }

        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5.0)
        }
    }
}
