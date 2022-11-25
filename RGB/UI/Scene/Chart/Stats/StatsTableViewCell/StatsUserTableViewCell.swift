//
//  StatsUserCell.swift
//  RGB
//
//  Created by 박준하 on 2022/11/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class StatsUserTableViewCell: UITableViewCell {
    
    static let identifier = "StatsUserTableViewCell"
    
    let img : UIImageView = { // 이미지 생성
        let imgView = UIImageView()
        imgView.image = UIImage(named: "RGBLogo")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let userName = UILabel().then {
        $0.text = "상어상어"
        $0.textColor = UIColor.gray
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
    }
    
    let allPercent = UILabel().then {
        $0.text = "20.00%"
        $0.textColor = UIColor.gray
        $0.font = .systemFont(ofSize: 24.0, weight: .bold)
    }
    
    let valuation = UILabel().then {
        $0.text = "평가액 146,291원"
        $0.textColor = UIColor.gray
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension StatsUserTableViewCell {
    
    private func attribute() {
        img.layer.cornerRadius = 50
    }
    
    private func layout() {
        
        [
            img,
            userName,
            allPercent,
            valuation
        ].forEach { addSubview($0) }
        
        img.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.0)
            $0.leading.top.equalToSuperview()
            $0.width.height.equalTo(30.0)
        }
        
        userName.snp.makeConstraints {
            $0.top.equalTo(img.snp.top).offset(8.0)
            $0.leading.equalTo(img.snp.leading).inset(40.0)
        }
        
        allPercent.snp.makeConstraints {
            $0.top.equalTo(img.snp.bottom).offset(6.0)
            $0.leading.equalToSuperview()
        }
        
        valuation.snp.makeConstraints {
            $0.top.equalTo(allPercent.snp.bottom).offset(6.0)
            $0.leading.equalToSuperview()
        }
    }
}
