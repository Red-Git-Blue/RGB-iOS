//
//  MyRankView.swift
//  RGB
//
//  Created by 박준하 on 2022/11/19.
//

import UIKit

class MyRankView: UIView {
    private final var controller: UIViewController

    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var myRankLabel = UILabel().then {
        $0.text = "내 순위"
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .white
    }
    
    private lazy var myRankView = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 20
    }
}

extension MyRankView {
    func setup() {
        [
            myRankLabel,
            myRankView
        ].forEach { self.addSubview($0) }
        
        myRankLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.0)
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        myRankView.snp.makeConstraints {
            $0.top.equalTo(myRankLabel.snp.bottom).offset(12.0)
            $0.leading.equalTo(myRankLabel.snp.leading)
            $0.height.equalTo(50.0)
            $0.width.equalTo(370.0)
        }
    }
}
