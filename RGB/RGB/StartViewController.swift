//
//  StartViewController.swift
//  RGB
//
//  Created by 박준하 on 2022/10/18.
//

import UIKit
import RxCocoa
import RxSwift
import Then
import SnapKit

class StartViewController : UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private lazy var mainImageView: UIImageView = {
        let imageName = "MainBackground"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        return imageView
    }()
    
    private lazy var mainLoginButton = UIButton().then {
        let image = UIImage(named: "LoginButton")
        $0.setBackgroundImage(image, for: UIControl.State.normal)
        $0.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                print("🔥loginButton")
            })
            .disposed(by: disposeBag)
    }
    
    private lazy var mainSignUpButton = UIButton().then {
        let image = UIImage(named: "SignupButton")
        $0.setBackgroundImage(image, for: UIControl.State.normal)
        $0.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                print("💠signupButton")
            })
            .disposed(by: disposeBag)
    }
}

extension StartViewController {
    func setupLayout() {
        [
            mainImageView,
            mainLoginButton,
            mainSignUpButton
        ].forEach { view.addSubview($0) }
        
        let width = view.frame.width / 430
        let height = view.frame.height / 932
        
        mainImageView.snp.makeConstraints {
            $0.top.bottom.trailing.leading.equalToSuperview()
        }
        
        mainLoginButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20 * width)
            $0.trailing.equalToSuperview().inset(20 * width)
            $0.bottom.equalToSuperview().inset(350 * height)
            $0.height.equalTo(55 * height)
        }
        
        mainSignUpButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20 * width)
            $0.trailing.equalToSuperview().inset(20 * width)
            $0.bottom.equalTo(mainLoginButton.snp.bottom).offset(80 * height)
            $0.height.equalTo(55 * height)
        }
    }
}
