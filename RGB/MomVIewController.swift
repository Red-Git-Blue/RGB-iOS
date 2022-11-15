//
//  MomVIewController.swift
//  RGB
//
//  Created by 박준하 on 2022/10/22.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Then

class MomView {
    
    let disposeBag = DisposeBag()
    
    internal lazy var firstText = UILabel().then {
        $0.textColor = UIColor(named: "Primary")
        $0.font = .systemFont(ofSize: 58.0, weight: .bold)
        $0.text = "아직 회원이 아니신가요?"
    }
}

extension MomView {
    func updateWith(_ controller: UIViewController) {
        [
            firstText
        ].forEach { controller.view.addSubview($0)}
        
        firstText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
        }
    }
}
