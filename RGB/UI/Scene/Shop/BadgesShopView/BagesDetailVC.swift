//
//  BagesDetailView.swift
//  RGB
//
//  Created by 박준하 on 2022/11/14.
//

import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class BagesDetailViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
<<<<<<< 58749743b13387c4bacb2c273e89c43caa4d7777
=======
    
    var bageList: BagesListModel?
    var disposeBag = DisposeBag()
>>>>>>> 🎁:: giftButton

    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let bagesTapSectionView = BagesTapView(frame: .zero, viewController: self)
        
        let newBagesSectionView = NewBadgesView(frame: .zero, viewController: self)
        
        let lastTextView = LastTextView(frame: .zero, viewController: self)
        
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(640.0)
        }
        
        let lastSpacingView = UIView()
        lastSpacingView.snp.makeConstraints {
            $0.height.equalTo(250)
        }
        
        [
            bagesTapSectionView,
            spacingView,
            newBagesSectionView,
            lastTextView,
            lastSpacingView
            
        ].forEach {
            stackView.addArrangedSubview($0)
        }
        
    }
    
<<<<<<< 58749743b13387c4bacb2c273e89c43caa4d7777
    var bageList: BagesListModel?
    
    var disposeBag = DisposeBag()
=======
    private let buttonView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private lazy var purchaseButton = UIButton().then {
        $0.setTitle("구매하기", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .white), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .red
    }
>>>>>>> 🎁:: giftButton
    
    private lazy var giftButton = UIButton().then {
        $0.setTitle("선물하기", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .white), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .green
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
<<<<<<< 58749743b13387c4bacb2c273e89c43caa4d7777
    }
=======
        setup()
        purchaseButton.layer.cornerRadius = 20
        giftButton.layer.cornerRadius = 20
        
        view.backgroundColor = .systemBackground
        
        purchaseButton.rx.tap
            .bind {
                print("🧾:: 구매하기!!")
            }.disposed(by: disposeBag)
        
        giftButton.rx.tap
            .bind {
                print("🎁:: 선물하기!!")
            }.disposed(by: disposeBag)
      }
>>>>>>> 🎁:: giftButton
}
private extension BagesDetailViewController {

    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setup() {
        [
            buttonView,
            purchaseButton,
            giftButton
        ].forEach { view.addSubview($0) }
        
        buttonView.snp.makeConstraints {
          $0.left.right.bottom.equalToSuperview()
          $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-60)
        }
        
        purchaseButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(20)
            $0.height.equalTo(50.0)
            $0.width.equalTo(172.0)
        }
        
        giftButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(20)
            $0.height.equalTo(50.0)
            $0.width.equalTo(172.0)
        }
    }
}
