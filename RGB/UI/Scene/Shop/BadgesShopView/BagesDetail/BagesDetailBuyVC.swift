//
//  BagesDetailBuyVC.swift
//  RGB
//
//  Created by 박준하 on 2022/11/16.
//

import UIKit
import Then
import SnapKit

class BagesDetailBuyViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.largestUndimmedDetentIdentifier = .large
            let id = UISheetPresentationController.Detent.Identifier("buyCustom")
            let buyCustomDetent = UISheetPresentationController.Detent.custom(identifier: id) { context in
                return 240
            }
            sheetPresentationController.detents = [buyCustomDetent]
        }
        self.isModalInPresentation = true
        
        setup()
        bagesImage.layer.cornerRadius = 20
        purchaseButton.layer.cornerRadius = 20
        cancelButton.layer.cornerRadius = 20
    }
    
    private lazy var bagesImage = UIImageView().then {
        $0.backgroundColor = .red
    }
    
    private lazy var bagesName = UILabel().then {
        $0.text = "고급스러운 무의 배지"
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.textColor = .label
    }
    
    private lazy var personHoldingLabel = UILabel().then {
        $0.text = "83,463,910,234원 보유중"
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .gray
    }
    
    private lazy var bagesPrice = UILabel().then {
        $0.text = "12,000원"
        $0.font = .systemFont(ofSize: 24.0, weight: .bold)
        $0.textColor = .white
    }
    
    private lazy var purchaseButton = UIButton().then {
        $0.setTitle("구매하기", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .white), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .red
    }
    
    private lazy var cancelButton = UIButton().then {
        $0.setTitle("취소하기", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .white), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .green
    }
}

extension BagesDetailBuyViewController {
    func setup() {
        [
            bagesImage,
            bagesName,
            personHoldingLabel,
            bagesPrice,
            purchaseButton,
            cancelButton
        ].forEach { view.addSubview($0) }
        
        bagesImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30.0)
            $0.leading.equalToSuperview().inset(30.0)
            $0.height.equalTo(60)
            $0.width.equalTo(60)
        }
        
        bagesName.snp.makeConstraints {
            $0.top.equalTo(bagesImage.snp.top).offset(5.0)
            $0.leading.equalTo(bagesImage.snp.leading).inset(70.0)
        }
        
        personHoldingLabel.snp.makeConstraints {
            $0.top.equalTo(bagesName.snp.bottom).offset(8.0)
            $0.leading.equalTo(bagesName.snp.leading)
        }
        
        bagesPrice.snp.makeConstraints {
            $0.top.equalTo(personHoldingLabel.snp.bottom).offset(20.0)
            $0.leading.equalTo(bagesImage.snp.leading)
        }
        
        purchaseButton.snp.makeConstraints {
            $0.top.equalTo(bagesPrice.snp.bottom).offset(25.0)
            $0.leading.equalTo(bagesPrice.snp.leading)
            $0.height.equalTo(50.0)
            $0.width.equalTo(172.0)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(purchaseButton.snp.top)
            $0.trailing.equalToSuperview().inset(30.0)
            $0.height.equalTo(50.0)
            $0.width.equalTo(172.0)
        }
    }
}
