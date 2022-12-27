//
//  SearchCollectionView.swift
//  RGB
//
//  Created by 박준하 on 2022/12/27.
//

import UIKit
import SnapKit
import Then

class SearchTableViewCell: UITableViewCell {
    static let identifier = "SearchTableViewCell"
    
    var userimageView = UIImageView().then {
        $0.backgroundColor = .red
        $0.layer.borderColor = UIColor.tertiaryLabel.cgColor
        $0.layer.cornerRadius = 15
    }

    var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .label
        $0.numberOfLines = 2
    }

    var descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .semibold)
        $0.textColor = .secondaryLabel
    }
    
    var bagesImageBackgroundView = UIImageView().then {
        $0.backgroundColor = .gray
    }
    
    var bagesImageView = UIImageView().then {
        $0.backgroundColor = .yellow
    }

    func attribute() {
        titleLabel.text = "JUNHA0211"
        descriptionLabel.text = "12345678"
        bagesImageBackgroundView.layer.cornerRadius = 20
        bagesImageView.layer.cornerRadius = 15
    }
    
    func layout() {
        [
            userimageView,
            titleLabel,
            descriptionLabel,
            bagesImageBackgroundView,
            bagesImageView
        ].forEach { addSubview($0) }

        userimageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.0)
            $0.top.equalToSuperview().inset(22.0)
            $0.bottom.equalToSuperview().inset(20.0)
            $0.width.equalTo(35.0)
            $0.height.equalTo(35.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(userimageView.snp.trailing).offset(10.0)
            $0.top.equalTo(userimageView.snp.top)
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5.0)
        }
        
        bagesImageBackgroundView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(75.0)
            $0.width.equalTo(70.0)
        }
            
        bagesImageView.snp.makeConstraints {
            $0.centerX.equalTo(bagesImageBackgroundView.snp.centerX)
            $0.centerY.equalTo(bagesImageBackgroundView.snp.centerY)
            $0.height.equalTo(30.0)
            $0.width.equalTo(30.0)
        }
    }
}
