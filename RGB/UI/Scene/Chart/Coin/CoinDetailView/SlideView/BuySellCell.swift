//
//  MyCell.swift
//  RGB
//
//  Created by 박준하 on 2022/12/08.
//

import UIKit
import SnapKit
import Then

final class BuySellCell: UICollectionViewCell {
    // MARK: Constants
    static var id = "MyCell"
    static var color: UIColor = .black
    
    // MARK: UI
    private var imageView = UIImageView().then {
        $0.isUserInteractionEnabled = false
        $0.backgroundColor = color
    }
    private var coinLabel = UILabel().then {
        $0.text = "1,834,728원"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.numberOfLines = 1
        $0.textColor = .white
        //    $0.textAlignment = .center
    }
    
    private var coinTextLabel = UILabel().then {
        $0.text = "12코인"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.numberOfLines = 1
        $0.textColor = .gray
    }
    
    private var plusCoinButtonBG = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    private var minusButton = UIButton().then {
        $0.setTitle("-", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .white), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .black
    }
    
    private var coinCountLabel = UILabel().then {
        $0.text = "12"
        $0.font = .systemFont(ofSize: 20, weight: .regular)
        $0.numberOfLines = 1
        $0.textColor = .white
    }
    
    private var plusButton = UIButton().then {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .white), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .black
    }
    
    private var coinsLabel = UILabel().then  {
        $0.text = "코인"
        $0.font = .systemFont(ofSize: 20, weight: .regular)
        $0.numberOfLines = 1
        $0.textColor = .white
    }
    
    private var userHaveLabel = UILabel().then {
        $0.text = "83,463,910,234원 보유중"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.numberOfLines = 1
        $0.textColor = .systemGray2
    }
    
    private var buyButton = UIButton().then {
        $0.setTitle("매수", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .white), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .red
    }
    
    private var sellButton = UIButton().then {
        $0.setTitle("매도", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .white), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .blue
    }
    // MARK: Initializer
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        plusCoinButtonBG.layer.cornerRadius = 25
        minusButton.layer.cornerRadius = 20
        plusButton.layer.cornerRadius = 20
        buyButton.layer.cornerRadius = 20
        sellButton.layer.cornerRadius = 20
        [
            imageView,
            coinLabel,
            coinTextLabel,
            plusCoinButtonBG,
            minusButton,
            coinCountLabel,
            plusButton,
            coinsLabel,
            userHaveLabel,
            buyButton,
            sellButton
        ].forEach { self.addSubview($0)}
        
        self.imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        self.coinLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top).offset(20.0)
            $0.leading.equalTo(imageView.snp.leading).inset(30.0)
        }
        
        self.coinTextLabel.snp.makeConstraints {
            $0.top.equalTo(coinLabel.snp.bottom).offset(6.0)
            $0.leading.equalTo(coinLabel.snp.leading)
        }
        
        self.plusCoinButtonBG.snp.makeConstraints {
            $0.top.equalTo(coinTextLabel.snp.bottom).offset(36.0)
            $0.leading.equalTo(coinTextLabel.snp.leading)
            $0.height.equalTo(50.0)
            $0.width.equalTo(250.0)
        }
        
        self.minusButton.snp.makeConstraints {
            $0.height.width.equalTo(40.0)
            $0.top.equalTo(plusCoinButtonBG.snp.top).offset(5.0)
            $0.leading.equalTo(plusCoinButtonBG.snp.leading).offset(5.0)
        }
        
        self.coinCountLabel.snp.makeConstraints {
            $0.centerX.equalTo(plusCoinButtonBG.snp.centerX)
            $0.centerY.equalTo(plusCoinButtonBG.snp.centerY)
        }
        
        self.plusButton.snp.makeConstraints {
            $0.height.width.equalTo(40.0)
            $0.trailing.equalTo(plusCoinButtonBG.snp.trailing).inset(5.0)
            $0.top.equalTo(plusCoinButtonBG.snp.top).offset(5.0)
        }
        
        self.coinsLabel.snp.makeConstraints {
            $0.top.equalTo(coinCountLabel.snp.top)
            $0.leading.equalTo(plusCoinButtonBG.snp.trailing).offset(20.0)
        }
        
        self.userHaveLabel.snp.makeConstraints {
            $0.top.equalTo(plusCoinButtonBG.snp.bottom).offset(20.0)
            $0.leading.equalTo(plusCoinButtonBG.snp.leading)
        }
        
        self.buyButton.snp.makeConstraints {
            $0.top.equalTo(userHaveLabel.snp.bottom).offset(22.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.height.equalTo(50.0)
            $0.width.equalTo(172.0)
        }
        
        self.sellButton.snp.makeConstraints {
            $0.top.equalTo(buyButton.snp.top)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(50.0)
            $0.width.equalTo(172.0)
        }
    }
}
