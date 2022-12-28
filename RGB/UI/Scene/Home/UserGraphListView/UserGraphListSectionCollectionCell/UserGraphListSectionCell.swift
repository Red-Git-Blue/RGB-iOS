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
    
    var graphListbackgroundView = LineChartView()
    
    var userSetView = UIView().then {
        $0.backgroundColor = UIColor(named: "CollectionViewColor")
    }

    var imageView = UIImageView().then {
        $0.image = UIImage(named: "둥이배지")
        $0.layer.cornerRadius = 18
    }

    var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .white
        $0.numberOfLines = 2
        $0.text = "HYUNSUK"
    }

    var descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .regular)
        $0.textColor = .white
        $0.text = "김현석"
    }

    var coinPriceLabel = UILabel().then {
        $0.text = "152,894원"
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .white
    }

    var inDecreaseLabel = UILabel().then {
        $0.text = "+12,000원 (+4.2%)"
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
        var dataArray: [ChartDataEntry] = []
        for i in 0...50 {
            dataArray.append(ChartDataEntry(x: Double(i), y: Double.random(in: 0...120)))
        }
        let dataSet = LineChartDataSet(entries: dataArray)
        dataSet.setColor(NSUIColor.red)
        dataSet.drawCirclesEnabled = false
        dataSet.drawValuesEnabled = false
        let chartData = LineChartData(dataSet: dataSet)
        graphListbackgroundView.data = chartData
        graphListbackgroundView.xAxis.enabled = false
        graphListbackgroundView.leftAxis.enabled = false
        graphListbackgroundView.rightAxis.enabled = false
        graphListbackgroundView.dragEnabled = false
        graphListbackgroundView.scaleXEnabled = false
        graphListbackgroundView.scaleYEnabled = false
        graphListbackgroundView.legend.enabled = false
    }
    
    func layout() {
        [
            graphListbackgroundView,
            userSetView,
            imageView,
            titleLabel,
            descriptionLabel,
            coinPriceLabel,
            inDecreaseLabel
        ].forEach { addSubview($0) }

        graphListbackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
            $0.bottom.equalTo(userSetView.snp.top).offset(30)
        }
        
        userSetView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(100)
            $0.height.equalTo(100)
            $0.width.equalTo(366)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(userSetView.snp.top).inset(20.0)
            $0.width.height.equalTo(35.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top)
            $0.leading.equalTo(imageView.snp.trailing).offset(10.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(3.0)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        coinPriceLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top)
            $0.trailing.equalTo(userSetView.snp.trailing).inset(20.0)
        }
        
        inDecreaseLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.top)
            $0.trailing.equalTo(coinPriceLabel.snp.trailing)
        }
    }
}
