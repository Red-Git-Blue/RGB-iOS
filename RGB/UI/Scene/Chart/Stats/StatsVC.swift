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
}

extension StatsViewController {
    func setup() {
        [
            piegraphView,
            allAssetsLabel
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
    }
}
