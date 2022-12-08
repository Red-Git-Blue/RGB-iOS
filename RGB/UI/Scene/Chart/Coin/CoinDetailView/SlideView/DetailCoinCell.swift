//
//  TowCell.swift
//  RGB
//
//  Created by 박준하 on 2022/12/08.
//

import UIKit
import SnapKit
import Then

final class DetailCoinCell: UICollectionViewCell {
    // MARK: Constants
    static var id = "TowCell"
    static var color: UIColor = .black
    
    // MARK: UI
    private var imageView = UIImageView().then {
        $0.isUserInteractionEnabled = false
        $0.backgroundColor = color
    }
    
    private lazy var lastEndCoin = UILabel().then {
        $0.text = "전일 종가"
        $0.font = UIFont(name: "Roboto-Bold", size: 14.0)
        $0.textColor = UIColor(named: "CoustomGray")
    }
    
    private lazy var lastEndCoinLabel = UILabel().then {
        $0.text = "152,644원"
        $0.font = UIFont(name: "Roboto-Bold", size: 16.0)
        $0.textColor = .white
    }
    
    private lazy var startingPrice = UILabel().then {
        $0.text = "개장가"
        $0.font = UIFont(name: "Roboto-Bold", size: 14.0)
        $0.textColor = UIColor(named: "CoustomGray")
    }
    
    private lazy var startingPriceLabel = UILabel().then {
        $0.text = "152,644원"
        $0.font = UIFont(name: "Roboto-Bold", size: 16.0)
        $0.textColor = .white
    }
    
    private lazy var highestPrice = UILabel().then {
        $0.text = "최고가"
        $0.font = UIFont(name: "Roboto-Bold", size: 14.0)
        $0.textColor = UIColor(named: "CoustomGray")
    }
    
    private lazy var highestPriceLabel = UILabel().then {
        $0.text = "324,789원"
        $0.font = UIFont(name: "Roboto-Bold", size: 16.0)
        $0.textColor = .red
    }
    
    private lazy var lowestPrice = UILabel().then {
        $0.text = "최저가"
        $0.font = UIFont(name: "Roboto-Bold", size: 14.0)
        $0.textColor = UIColor(named: "CoustomGray")
    }
    
    private lazy var lowestPriceLabel = UILabel().then {
        $0.text = "12원"
        $0.font = UIFont(name: "Roboto-Bold", size: 14.0)
        $0.textColor = .blue
    }
    
    private lazy var tradingVolume = UILabel().then {
        $0.text = "거래량"
        $0.font = UIFont(name: "Roboto-Bold", size: 14.0)
        $0.textColor = UIColor(named: "CoustomGray")
    }
    
    private lazy var tradingVolumeLabel = UILabel().then {
        $0.text = "1.2억"
        $0.font = UIFont(name: "Roboto-Bold", size: 16.0)
        $0.textColor = .white
    }
    
    private lazy var coinStartDate = UILabel().then {
        $0.text = "코인상장일자"
        $0.font = UIFont(name: "Roboto-Bold", size: 14.0)
        $0.textColor = UIColor(named: "CoustomGray")
    }
    
    private lazy var coinStartDateLabel = UILabel().then {
        $0.text = "2022-11-14"
        $0.font = UIFont(name: "Roboto-Bold", size: 16.0)
        $0.textColor = .white
    }
    
    // MARK: Initializer
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [
            imageView,
            lastEndCoin,
            lastEndCoinLabel,
            startingPrice,
            startingPriceLabel,
            highestPrice,
            highestPriceLabel,
            lowestPrice,
            lowestPriceLabel,
            tradingVolume,
            tradingVolumeLabel,
            coinStartDate,
            coinStartDateLabel
            
        ].forEach { self.addSubview($0)}
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        lastEndCoin.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top).offset(30.0)
            $0.leading.equalTo(imageView.snp.leading).inset(30.0)
        }
        
        lastEndCoinLabel.snp.makeConstraints {
            $0.top.equalTo(lastEndCoin.snp.bottom).offset(6.0)
            $0.leading.equalTo(lastEndCoin.snp.leading)
        }
        
        startingPrice.snp.makeConstraints {
            $0.top.equalTo(lastEndCoin.snp.top)
            $0.leading.equalTo(lastEndCoin.snp.trailing).offset(135.0)
        }
        
        startingPriceLabel.snp.makeConstraints {
            $0.top.equalTo(lastEndCoinLabel.snp.top)
            $0.leading.equalTo(startingPrice.snp.leading)
        }
        
        highestPrice.snp.makeConstraints {
            $0.top.equalTo(lastEndCoinLabel.snp.bottom).offset(40.0)
            $0.leading.equalTo(lastEndCoinLabel.snp.leading)
        }
        
        highestPriceLabel.snp.makeConstraints {
            $0.top.equalTo(highestPrice.snp.bottom).offset(6.0)
            $0.leading.equalTo(highestPrice.snp.leading)
        }
        
        lowestPrice.snp.makeConstraints {
            $0.top.equalTo(highestPrice.snp.top)
            $0.leading.equalTo(startingPrice.snp.leading)
        }
        
        lowestPriceLabel.snp.makeConstraints {
            $0.top.equalTo(lowestPrice.snp.bottom).offset(6.0)
            $0.leading.equalTo(startingPriceLabel.snp.leading)
        }
        
        tradingVolume.snp.makeConstraints {
            $0.top.equalTo(highestPriceLabel.snp.bottom).offset(40.0)
            $0.leading.equalTo(highestPriceLabel.snp.leading)
        }
        
        tradingVolumeLabel.snp.makeConstraints {
            $0.top.equalTo(tradingVolume.snp.bottom).offset(6.0)
            $0.leading.equalTo(tradingVolume.snp.leading)
        }
        
        coinStartDate.snp.makeConstraints {
            $0.top.equalTo(tradingVolume.snp.top)
            $0.leading.equalTo(lowestPriceLabel.snp.leading)
        }
        
        coinStartDateLabel.snp.makeConstraints {
            $0.top.equalTo(coinStartDate.snp.bottom).offset(6.0)
            $0.leading.equalTo(coinStartDate.snp.leading)
        }
    }
}
