//
//  ChangeThemeCell.swift
//  RGB
//
//  Created by 박준하 on 2022/11/17.
//

import UIKit
import SnapKit

class ChangeThemeCell: UITableViewCell {
    
    private lazy var themeLable = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .black)
        $0.text = "테마 변경"
    }
    
    private lazy var themeImage = UIImageView().then {
        $0.backgroundColor = .red
    }
}

extension ChangeThemeCell {
    func setup() {
        [
            themeImage,
            themeLable
        ].forEach { self.addSubview($0) }
        
        themeImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.height.width.equalTo(20.0)
        }
        themeLable.snp.makeConstraints {
            $0.top.equalTo(themeImage.snp.top).offset(1.0)
            $0.leading.equalTo(themeImage.snp.leading).inset(40.0)
        }
    }
}
