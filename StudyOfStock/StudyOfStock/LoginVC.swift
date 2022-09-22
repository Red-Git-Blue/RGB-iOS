//
//  LoginVC.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/09/21.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
//    let font = SosFont.getFont()
    
    
    var disposeBag = DisposeBag()
    
    private lazy var mainImageView: UIImageView = {
        let imageName = "LoginView"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        return imageView
    }()
    
    private lazy var sosLogo: UIImageView = {
        let imageLogo = "SOSLogo"
        let image = UIImage(named: imageLogo)
        let imageView = UIImageView(image: image!)
        
        return imageView
    }()
    
    private lazy var notMember: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 32.0, weight: .bold)
        label.text = "로그인"
        
       return label
    }()
    
    private lazy var goToLogin: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        label.text = "로그인 하여 시작하세요"
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        upView()
    }
}

extension LoginViewController {
    func setupLayout() {
        [
            mainImageView,
            sosLogo,
            notMember,
            goToLogin
        ].forEach { view.addSubview($0) }
        
        mainImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        sosLogo.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().offset(70)
            $0.height.equalTo(60)
            $0.width.equalTo(60)
        }
        
        notMember.snp.makeConstraints {
            $0.top.equalTo(sosLogo.snp.bottom).offset(50)
            $0.leading.equalTo(sosLogo.snp.leading)
        }
        
        goToLogin.snp.makeConstraints {
            $0.top.equalTo(notMember.snp.bottom).offset(10)
            $0.leading.equalTo(notMember.snp.leading)
        }
    }
}

extension LoginViewController {
    
    func upView() {
        Observable<Int>.interval(.seconds(Int(0)), scheduler: MainScheduler.instance)
            .take(0)
            .subscribe(onNext: { value in
              print(value)
            }, onError: { error in
              print(error)
            }, onCompleted: {
              print("onCompleted")
            }, onDisposed: {
              print("onDisposed")
            })
            .disposed(by: disposeBag)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {

            let TestViewContoller = TestViewContoller()
            self.present(TestViewContoller, animated: true)
        }
    }
}
