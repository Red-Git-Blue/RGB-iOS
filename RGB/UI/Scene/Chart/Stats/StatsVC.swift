//
//  statsVC.swift
//  RGB
//
//  Created by 박준하 on 2022/11/19.
//

import UIKit
import Then
import SnapKit

class StatsViewController: BaseAbstractChart {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewIndex() -> Int {
        return 1
    }
    
    private lazy var piegraphView = UIView().then {
        $0.backgroundColor = .yellow
    }
    
    private lazy var allAssetsLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .white
        $0.text = "총 자산"
    }
    
    private lazy var userAllAsstsLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 32.0, weight: .bold)
        $0.textColor = .white
        $0.text = "482,930원"
    }
    
    private lazy var allDamageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .white
        $0.text = "총 손익"
    }
    
    private lazy var userAllDamageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .bold)
        $0.textColor = .white
        $0.text = "482,930원"
    }
    
    private lazy var percentDamgeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .red
        $0.text = "(+34.21%)"
    }
}

extension StatsViewController {
    func setup() {
        [
            piegraphView,
            allAssetsLabel,
            userAllAsstsLabel,
            allDamageLabel,
            userAllDamageLabel,
            percentDamgeLabel
        ].forEach { view.addSubview($0) }
        
        piegraphView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.trailing.equalToSuperview().inset(13.0)
            $0.height.width.equalTo(220.0)
        }
        
        allAssetsLabel.snp.makeConstraints {
            $0.top.equalTo(piegraphView.snp.bottom).offset(42)
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        userAllAsstsLabel.snp.makeConstraints {
            $0.top.equalTo(allAssetsLabel.snp.bottom).offset(10.0)
            $0.leading.equalTo(allAssetsLabel.snp.leading)
        }
        
        allDamageLabel.snp.makeConstraints {
            $0.top.equalTo(userAllAsstsLabel.snp.bottom).offset(40.0)
            $0.leading.equalTo(userAllAsstsLabel.snp.leading)
        }
        
        userAllDamageLabel.snp.makeConstraints {
            $0.top.equalTo(allDamageLabel.snp.bottom).offset(10.0)
            $0.leading.equalTo(allDamageLabel.snp.leading)
        }
        
        percentDamgeLabel.snp.makeConstraints {
            $0.top.equalTo(userAllDamageLabel.snp.bottom).offset(6.0)
            $0.leading.equalTo(userAllDamageLabel.snp.leading)
        }
    }
}
