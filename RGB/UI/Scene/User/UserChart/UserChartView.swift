//
//  UserChartView.swift
//  RGB
//
//  Created by 박준하 on 2022/11/16.
//

import UIKit

class UserChartView: UIView {
    private final var controller: UIViewController
    
    private lazy var backgroundView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    private lazy var chartView = UIView().then {
        $0.backgroundColor = .red
    }
    
    private lazy var coinLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.text = "내 코인"
        $0.textColor = .white
    }
    
    private lazy var coinPriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.text = "54,250.00"
        $0.textColor = .white
    }
    
    private lazy var lastCoinLabelTitle = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .bold)
        $0.text = "전날 종가"
        $0.textColor = .white
    }
    
    private lazy var lastcoinLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .bold)
        $0.text = "47,650.00"
        $0.textColor = .white
    }
    
    private lazy var averageCoinLabelTitle = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .bold)
        $0.text = "평균 거래량"
        $0.textColor = .white
    }
    
    private lazy var averageCoinLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .bold)
        $0.text = "250.34만"
        $0.textColor = .white
    }
    
    private lazy var marketCapCoinLabelTitle = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .bold)
        $0.text = "시가 총액"
        $0.textColor = .white
    }
    
    private lazy var marketCapCoinLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .bold)
        $0.text = "250.34만"
        $0.textColor = .white
    }
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        setup()
        backgroundView.layer.cornerRadius = 20
        chartView.layer.cornerRadius = 20
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UserChartView {
    func setup() {
        [
            coinLabel,
            backgroundView,
            chartView,
            coinPriceLabel,
            lastCoinLabelTitle,
            lastcoinLabel,
            averageCoinLabelTitle,
            averageCoinLabel,
            marketCapCoinLabelTitle,
            marketCapCoinLabel
        ].forEach { self.addSubview($0) }
        
        coinLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        backgroundView.snp.makeConstraints {
            $0.top.equalTo(coinLabel.snp.bottom).offset(12.0)
            $0.leading.equalTo(coinLabel.snp.leading)
            $0.height.equalTo(120)
            $0.width.equalTo(370)
        }
        
        chartView.snp.makeConstraints {
            $0.top.equalTo(coinLabel.snp.bottom).offset(12.0)
            $0.leading.equalTo(coinLabel.snp.leading)
            $0.height.equalTo(120.0)
            $0.width.equalTo(180.0)
        }
        
        coinPriceLabel.snp.makeConstraints {
            $0.top.equalTo(backgroundView.snp.top).offset(17.0)
            $0.trailing.equalTo(backgroundView.snp.trailing).inset(77.0)
        }
        
        lastCoinLabelTitle.snp.makeConstraints {
            $0.top.equalTo(coinPriceLabel.snp.bottom).offset(10.0)
            $0.leading.equalTo(coinPriceLabel.snp.leading)
        }
        
        lastcoinLabel.snp.makeConstraints {
            $0.top.equalTo(coinPriceLabel.snp.bottom).offset(10.0)
            $0.trailing.equalTo(backgroundView.snp.trailing).inset(20.0)
        }
        
        averageCoinLabelTitle.snp.makeConstraints {
            $0.top.equalTo(lastCoinLabelTitle.snp.bottom).offset(5.0)
            $0.leading.equalTo(lastCoinLabelTitle.snp.leading)
        }
        
        averageCoinLabel.snp.makeConstraints {
            $0.top.equalTo(lastCoinLabelTitle.snp.bottom).offset(5.0)
            $0.trailing.equalTo(lastcoinLabel.snp.trailing)
        }
        
        marketCapCoinLabelTitle.snp.makeConstraints {
            $0.top.equalTo(averageCoinLabelTitle.snp.bottom).offset(5.0)
            $0.leading.equalTo(averageCoinLabelTitle.snp.leading)
        }
        
        marketCapCoinLabel.snp.makeConstraints {
            $0.top.equalTo(averageCoinLabel.snp.bottom).offset(5.0)
            $0.trailing.equalTo(averageCoinLabel.snp.trailing)
        }
    }
}
