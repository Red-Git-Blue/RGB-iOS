//
//  UserGraphListDetileVC.swift
//  RGB
//
//  Created by 박준하 on 2022/11/01.
//

import UIKit
import Then 
import SnapKit
import RxSwift

class UserGraphListDetileViewController: UIViewController {
    
    var userGraphList: UserGraphListModel?
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.largestUndimmedDetentIdentifier = .large
            let id = UISheetPresentationController.Detent.Identifier("DetailCustom")
            let DetailCustomDetent = UISheetPresentationController.Detent.custom(identifier: id) { context in
                return 780
            }
            sheetPresentationController.detents = [DetailCustomDetent]
            self.isModalInPresentation = true
        }
        setup()
    }
    
    internal lazy var downButton = UIButton().then {
        let image = UIImage(named: "downButton")
        $0.setBackgroundImage(image, for: UIControl.State.normal)
        $0.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                print("💠downButton")
                self!.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
    
    internal lazy var titleLabel = UILabel().then {
        $0.text = "내 보유내역"
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.textColor = .label
    }
    
    internal lazy var userImage = UIImageView().then {
        $0.backgroundColor = .red
        $0.layer.borderColor = UIColor.tertiaryLabel.cgColor
        $0.layer.cornerRadius = 13
    }
    
    internal lazy var userName = UILabel().then {
        $0.text = userGraphList?.userName ?? "이름이 없음"
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .white
    }
    
    internal lazy var userTakeCoin = UILabel().then {
        $0.text = userGraphList?.iTakeCoins ?? "보유하고 있는 코인이 없음"
        $0.font = .systemFont(ofSize: 12.0, weight: .regular)
        $0.textColor = .systemGray2
    }
    
    internal lazy var graphList = UIView().then {
        $0.layer.cornerRadius = 20.0
        $0.backgroundColor = UIColor(named: "CollectionViewColor")
    }
    
    internal lazy var appraisedValue = UILabel().then {
        $0.text = "평가액"
        $0.font = UIFont(name: "Roboto-Bold", size: 14.0)
        $0.textColor = .white
    }
    
    internal lazy var nowCoinPriceLabel = UILabel().then {
        $0.text = "\(userGraphList!.nowCoinPrice!)원"
        $0.font = UIFont(name: "Roboto-Bold", size: 24.0)
        $0.textColor = .white
    }
    
    internal lazy var firstPriceLabel = UILabel().then {
        $0.text = "원금 (나중에 데이터 받기)"
        $0.font = UIFont(name: "Roboto-Bold", size: 12.0)
        $0.textColor = UIColor(named: "CoustomGray")
    }
    
    private lazy var separator = UIView().then {_ in
        let separator = UIView()
        separator.backgroundColor = .separator
    }
    
    private lazy var contour = UIView().then {
        $0.backgroundColor = .separator
    }
    
    private lazy var reserve = UILabel().then {
        $0.text = "보유량"
        $0.font = UIFont(name: "Roboto-Bold", size: 14.0)
        $0.textColor = UIColor(named: "CoustomGray")
    }
    
    private lazy var reserveCoin = UILabel().then {
        $0.text = "\(userGraphList!.iTakeCoins!)"
        $0.font = UIFont(name: "Roboto-Bold", size: 16.0)
        $0.textColor = .white
    }
    
    private lazy var average = UILabel().then {
        $0.text = "평단가"
        $0.font = UIFont(name: "Roboto-Bold", size: 14.0)
        $0.textColor = UIColor(named: "CoustomGray")
    }
    
    private lazy var averagePrice = UILabel().then {
        $0.text = "나중에 평균가격 불러오기"
        $0.font = UIFont(name: "Roboto-Bold", size: 16.0)
    }
    
    private lazy var allRevenue = UILabel().then {
        $0.text = "총 수익"
        $0.font = UIFont(name: "Roboto-Bold", size: 14.0)
        $0.textColor = UIColor(named: "CoustomGray")
    }
    
    private lazy var allRevenuePrice = UILabel().then {
        $0.text = "총 수익 가격"
        $0.font = UIFont(name: "Roboto-Bold", size: 16.0)
        $0.textColor = UIColor(named: "HighColor")
    }
    
    private lazy var allRevenuePercent = UILabel().then {
        $0.text = "(+=오른가격%)"
        $0.font = UIFont(name: "Roboto-Bold", size: 14.0)
        $0.textColor = UIColor(named: "HighColor")
    }
    
    private lazy var dailyRevenue = UILabel().then {
        $0.text = "일간 수익"
        $0.font = UIFont(name: "Roboto-Bold", size: 14.0)
        $0.textColor = UIColor(named: "CoustomGray")
    }
    
    private lazy var toDayRevenuePrice = UILabel().then {
        $0.text = "일간 수익 가격"
        $0.font = UIFont(name: "Roboto-Bold", size: 16.0)
        $0.textColor = UIColor(named: "HighColor")
    }
    
    private lazy var toDayPricePercent = UILabel().then {
        $0.text = "(+오늘하루 수익%)"
        $0.font = UIFont(name: "Roboto-Bold", size: 16.0)
        $0.textColor = UIColor(named: "HighColor")
    }
    
    private lazy var dealButton = UIButton().then {
        $0.setTitle("거래하기", for: .normal)
        $0.backgroundColor = UIColor(named: "CollectionViewColor")
        $0.setTitleColor(UIColor(ciColor: .white), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20.0)
        $0.layer.cornerRadius = 20
    }
}


extension UserGraphListDetileViewController {
    func setup() {
        [
            downButton,
            titleLabel,
            userImage,
            userName,
            userTakeCoin,
            graphList,
            appraisedValue,
            nowCoinPriceLabel,
            firstPriceLabel,
            contour,
            reserve,
            reserveCoin,
            average,
            averagePrice,
            allRevenue,
            allRevenuePrice,
            allRevenuePercent,
            dailyRevenue,
            toDayRevenuePrice,
            toDayPricePercent,
            dealButton
        ].forEach { view.addSubview($0) }
        
        let buttonSize = 24
        
        downButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(28.0)
            $0.leading.equalToSuperview().offset(30.0)
            $0.height.equalTo(buttonSize)
            $0.width.equalTo(buttonSize)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(downButton.snp.top)
            $0.centerX.equalToSuperview()
        }
        
        userImage.snp.makeConstraints {
            $0.top.equalTo(downButton.snp.bottom).offset(28.0)
            $0.leading.equalTo(downButton.snp.leading)
            $0.height.equalTo(35)
            $0.width.equalTo(35)
        }
        
        userName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80.0)
            $0.leading.equalTo(userImage.snp.trailing).offset(10.0)
        }
        
        userTakeCoin.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom).offset(5.0)
            $0.leading.equalTo(userImage.snp.trailing).offset(10.0)
        }
        
        graphList.snp.makeConstraints {
            $0.top.equalTo(userTakeCoin.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(160.0)
            $0.width.equalTo(370.0)
        }
        
        appraisedValue.snp.makeConstraints {
            $0.top.equalTo(graphList.snp.bottom).offset(20.0)
            $0.leading.equalTo(userImage.snp.leading)
        }
        
        nowCoinPriceLabel.snp.makeConstraints {
            $0.top.equalTo(appraisedValue.snp.bottom).offset(6.0)
            $0.leading.equalTo(userImage.snp.leading)
        }
        
        firstPriceLabel.snp.makeConstraints {
            $0.top.equalTo(nowCoinPriceLabel.snp.bottom).offset(6.0)
            $0.leading.equalTo(userImage.snp.leading)
        }
        
        contour.snp.makeConstraints {
            $0.top.equalTo(firstPriceLabel.snp.bottom).offset(30.0)
            $0.leading.equalTo(userImage.snp.leading)
            $0.height.equalTo(0.5)
            $0.width.equalTo(370.0)
        }
        
        reserve.snp.makeConstraints {
            $0.top.equalTo(contour.snp.bottom).offset(30.0)
            $0.leading.equalTo(userImage.snp.leading)
        }
        
        reserveCoin.snp.makeConstraints {
            $0.top.equalTo(reserve.snp.bottom).offset(6.0)
            $0.leading.equalTo(userImage.snp.leading)
        }
        
        average.snp.makeConstraints {
            $0.top.equalTo(reserve.snp.top)
            $0.leading.equalTo(reserve.snp.leading).inset(146.0)
        }
        
        averagePrice.snp.makeConstraints {
            $0.top.equalTo(average.snp.bottom).offset(6.0)
            $0.leading.equalTo(average.snp.leading)
        }
        
        allRevenue.snp.makeConstraints {
            $0.top.equalTo(reserveCoin.snp.bottom).offset(40.0)
            $0.leading.equalTo(userImage.snp.leading)
        }
        
        allRevenuePrice.snp.makeConstraints {
            $0.top.equalTo(allRevenue.snp.bottom).offset(6.0)
            $0.leading.equalTo(userImage.snp.leading)
        }
        
        allRevenuePercent.snp.makeConstraints {
            $0.top.equalTo(allRevenuePrice.snp.bottom).offset(4.0)
            $0.leading.equalTo(userImage.snp.leading)
        }
        dailyRevenue.snp.makeConstraints {
            $0.top.equalTo(averagePrice.snp.bottom).offset(40.0)
            $0.leading.equalTo(allRevenue.snp.leading).inset(142.0)
        }
        toDayRevenuePrice.snp.makeConstraints {
            $0.top.equalTo(dailyRevenue.snp.bottom).offset(6.0)
            $0.leading.equalTo(dailyRevenue.snp.leading)
        }
        toDayPricePercent.snp.makeConstraints {
            $0.top.equalTo(toDayRevenuePrice.snp.bottom).offset(4.0)
            $0.leading.equalTo(toDayRevenuePrice.snp.leading)
        }
        dealButton.snp.makeConstraints {
            $0.top.equalTo(toDayRevenuePrice.snp.bottom).offset(103.0)
            $0.leading.equalTo(30.0)
            $0.width.equalTo(370.0)
            $0.height.equalTo(50.0)
        }
    }
}
