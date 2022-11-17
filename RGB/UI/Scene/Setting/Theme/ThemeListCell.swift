//
//  ThemeListCell.swift
//  RGB
//
//  Created by 박준하 on 2022/11/17.
//

import UIKit
import SnapKit
import Then

class ThemeListCell: UITableViewCell {
    
    private lazy var tapView = UIView().then {
        $0.backgroundColor = .red
    }
    
    internal lazy var userMode = UILabel().then {
        $0.text = ""
        $0.font = UIFont(name: "Roboto-Bold", size: 16.0)
        $0.textColor = .black
    }
}

extension ThemeListCell {
    func setup() {
        [
            tapView,
            userMode
        ].forEach { self.addSubview($0) }
        
        tapView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.height.width.equalTo(20.0)
        }
        
        userMode.snp.makeConstraints {
            $0.top.equalTo(tapView.snp.top).offset(1.0)
            $0.leading.equalTo(tapView.snp.leading).inset(20.0)
        }
    }
}
