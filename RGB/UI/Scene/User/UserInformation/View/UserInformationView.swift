//
//  UserInformationView.swift
//  RGB
//
//  Created by 박준하 on 2022/11/16.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import Moya

class UserInformationView: UIView {
    private final var controller: UIViewController
//    let provider = MoyaProvider<MyAPI>()
 
    
    let disposeBag = DisposeBag()
    
    private lazy var userProfileImage = UIImageView().then {
        $0.backgroundColor = .red
    }
    
    private lazy var userNickname = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .black)
        $0.text = "JJUNHAA"
        $0.textColor = .white
    }
    
    private lazy var userName = UILabel().then {
        $0.font = .systemFont(ofSize: 15.0, weight: .black)
        $0.text = "박준하"
        $0.textColor = .gray
    }
    
    private lazy var mailImage = UIImageView().then { _ in
        let imageName = "MailImage"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
    }
    
    private lazy var mailLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .regular)
        $0.text = "goodjunha@gmail.com"
        $0.textColor = .white
    }
    
    private lazy var moneyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .regular)
        $0.text = "-142,593,246원"
        $0.textColor = .white
    }
    
    private lazy var moneyImage = UIImageView().then {
        $0.backgroundColor = .blue
//        $0.image = UIImage(named: "MoneyImage")
    }
    
    private lazy var separator = UIView().then {
        $0.backgroundColor = .separator
    }
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        attribute()
        setup()
        
//        self.provider.rx
//            .request(.getMeInfo())
//            .subscribe { result in
//                if let acToken = KeyChain.read(key: Header.accesstoken.header()) {
//
//                }
//            }
        print("provider: \(provider)")
        let a = KeyChain.read(key: Token.accessToken)
        print("keyChain read accessToken : \(a)")
        
        self.provider.rx
            .request(MyAPI.getMeInfo)
            .subscribe { result in
                switch result {
                case let .success(moyaResponse):
                    let statusCode = moyaResponse.statusCode
                    print(result)
                    if(statusCode == 200) {
                        let data = moyaResponse.data
                        print(data)
                    } else {
                        print(moyaResponse.request?.headers)
                        print("🪓" + "\(statusCode)" + "fuck")
                    }
                case let .failure(error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserInformationView {
    
    func bind(_ viewModel: UserInformationViewModel) {
        
    }
    
    func attribute() {
        userProfileImage.layer.cornerRadius = 70
    }
    
    func setup() {
        [
            userProfileImage,
            userNickname,
            userName,
            mailImage,
            mailLabel,
            moneyImage,
            moneyLabel,
            separator
        ].forEach { self.addSubview($0) }
        
        userProfileImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(30.0)
            $0.height.width.equalTo(140.0)
        }
        
        userNickname.snp.makeConstraints {
            $0.top.equalTo(userProfileImage.snp.top).inset(14.0)
            $0.leading.equalTo(userProfileImage.snp.leading).inset(200.0)
        }
        
        userName.snp.makeConstraints {
            $0.top.equalTo(userNickname.snp.bottom).offset(1.0)
            $0.leading.equalTo(userNickname.snp.leading)
        }
        
        mailLabel.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom).offset(20.0)
            $0.leading.equalTo(userName.snp.leading)
        }
        
        moneyLabel.snp.makeConstraints {
            $0.top.equalTo(mailLabel.snp.bottom).offset(20.0)
            $0.leading.equalTo(mailLabel.snp.leading)
        }
        separator.snp.makeConstraints {
            $0.top.equalTo(moneyLabel.snp.bottom).offset(48.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1.0)
            $0.width.equalTo(370.0)
        }
    }
}
