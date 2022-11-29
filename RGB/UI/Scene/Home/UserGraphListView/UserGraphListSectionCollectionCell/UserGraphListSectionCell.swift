//
//  UserGraphListSectionCell.swift
//  RGB
//
//  Created by 박준하 on 2022/11/29.
//

import UIKit
import SnapKit
import Then
import Charts

class UserGraphListSectionCell: UICollectionViewCell {
    
    private lazy var chartView = UIView().then {
        $0.backgroundColor = .red
    }

    private lazy var imageView = UIImageView().then {
        $0.backgroundColor = .blue
//        $0.layer.borderColor = UIColor.tertiaryLabel.cgColor
        //        옆에 imageview 테두리 만들기
        //        imageView.layer.borderWidth = 0.5
//        $0.layer.cornerRadius = 15
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

    private lazy var coinPriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .white
    }

    private var inDecreaseLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 12.0, weight: .semibold)
        $0.textColor = .red
    }

    func setup() {
        attribute()
        layout()
    }
}

// MARK: Private
private extension UserGraphListSectionCell {
    
    func attribute() {
    }
    
    func layout() {
        [
            chartView,
            imageView
        ].forEach { addSubview($0) }

        chartView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(335.0)
            $0.width.equalTo(365.0)
        }
        
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(35.0)
        }
    }
}
