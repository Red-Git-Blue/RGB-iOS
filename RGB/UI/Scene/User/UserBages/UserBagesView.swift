//
//  UserBagesView.swift
//  RGB
//
//  Created by 박준하 on 2022/11/16.
//

import UIKit

class UserBagesView: UIView {
    private final var controller: UIViewController
    
    private lazy var bagesLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.text = "배지"
        $0.textColor = .white
    }
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        setup()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UserBagesView {
    func setup() {
        [
            bagesLabel
        ].forEach { self.addSubview($0) }
        
        bagesLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(30.0)
        }
    }
}
